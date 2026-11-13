"""Apply the shareable snapshot in an isolated home, without network access."""
from pathlib import Path
import json
import os
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
