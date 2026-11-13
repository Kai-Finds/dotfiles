"""Apply the shareable snapshot in an isolated home, without network access."""
from pathlib import Path
import json
import os
import plistlib
import subprocess
import tempfile
import tomllib

repo = Path(__file__).resolve().parents[1]
source = repo / "home"
for path in source.rglob("*"):
    if not path.is_file():
        continue
    text = path.read_text()
    assert "/Users/" not in text, f"Personal absolute path: {path}"
    if path.suffix == ".json" and path.parent.name != "zed":
        json.loads(text)
    elif path.suffix == ".toml":
        tomllib.loads(text)
    if path.suffix == ".zsh" or path.name in {"dot_zshrc", "dot_zprofile", "dot_zshenv", "dot_profile", "dot_bash_profile"}:
        subprocess.run(["zsh", "-n", str(path)], check=True)

# Theme selections must resolve to bundled assets, not an unrelated local install.
palette = tomllib.loads((source / "dot_config/starship.toml").read_text())
assert palette["palette"] == "catppuccin_mocha"
assert palette["palettes"]["catppuccin_mocha"]["base"] == "#1e1e2e"
assert 'theme = "Catppuccin Mocha"' in (source / "dot_config/ghostty/config").read_text()
assert 'colorscheme = "catppuccin-mocha"' in (source / "dot_config/nvim/lua/plugins/ui.lua").read_text()
bat_theme = source / "dot_config/bat/themes/Catppuccin Mocha.tmTheme"
assert plistlib.loads(bat_theme.read_bytes())["name"] == "Catppuccin Mocha"
assert '--theme="Catppuccin Mocha"' in (source / "dot_config/bat/config").read_text()
assert 'color_theme = "catppuccin_mocha"' in (source / "dot_config/btop/btop.conf").read_text()
assert (source / "dot_config/btop/themes/catppuccin_mocha.theme").is_file()
k9s = source / "Library/Application Support/k9s"
assert 'skin: catppuccin-mocha-transparent' in (k9s / "config.yaml").read_text()
assert "#1e1e2e" in (k9s / "skins/catppuccin-mocha-transparent.yaml").read_text()
zed = json.loads((source / "dot_config/zed/themes/catppuccin-mocha.json").read_text())
assert [theme["name"] for theme in zed["themes"]] == ["Catppuccin Mocha"]
assert '"dark": "Catppuccin Mocha"' in (source / "dot_config/zed/settings.json").read_text()
assert 'fg=#cdd6f4' in (source / "dot_tmux.conf").read_text()

with tempfile.TemporaryDirectory(prefix="dotfiles-test-") as tmp:
    tmp = Path(tmp)
    target = tmp / "home"
    target.mkdir()
    config = tmp / "chezmoi.toml"
    config.write_text("")
    cmd = ["chezmoi", "--config", str(config), "--source", str(repo),
           "--destination", str(target), "--persistent-state", str(tmp / "state.boltdb"),
           "--cache", str(tmp / "cache"), "--no-tty"]
    subprocess.run([*cmd, "apply"], check=True)
    subprocess.run([*cmd, "verify"], check=True)
    expected = {Path(*("." + part[4:] if part.startswith("dot_") else part
                        for part in p.relative_to(source).parts))
                for p in source.rglob("*")
                if p.is_file() and p.name not in {"README.md", ".chezmoiignore"}}
    actual = {p.relative_to(target) for p in target.rglob("*") if p.is_file()}
    assert actual == expected, f"Unexpected install: {actual ^ expected}"
    assert not (target / ".kube").exists()
    assert not list(target.rglob("README.md")), "Documentation must not be installed"
    assert not (target / ".chezmoiignore").exists()
    assert "debug-node:" in (target / "Library/Application Support/k9s/plugins.yaml").read_text()
    env = {**os.environ, "HOME": str(target), "ZDOTDIR": str(target),
           "XDG_CONFIG_HOME": str(target / ".config")}
    result = subprocess.run(["zsh", "-d", "-i", "-c", "print DOTFILES_OK"],
                            cwd=target, env=env, text=True, capture_output=True, timeout=30)
    assert result.returncode == 0, result.stderr
    assert not result.stderr.strip(), result.stderr
    assert "DOTFILES_OK" in result.stdout, result.stdout
print(f"OK: {len(expected)} files applied, verified, shell parsed and started in isolation.")
