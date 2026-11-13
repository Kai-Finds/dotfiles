# Gradual installation

[← Home](../README.md)

These commands target macOS / Apple Silicon. Run each block from the clone's root unless stated otherwise. Installing an application and applying its configuration are separate steps.

## 1. Clone and check without changing your environment

Requirements: macOS with Homebrew, Git, Python 3.11+, and chezmoi (`brew install chezmoi`). Clone the repository, then run the check:

```sh
git clone https://github.com/Kai-Finds/dotfiles.git
cd dotfiles
```

From this clone:

```sh
python3 tests/verify.py
```

The check applies the files in a temporary directory, verifies the result, and starts Zsh with that isolated HOME. It does not start Neovim or connect to a cluster.

## 2. Install the tools

Review the `Brewfile`, then install the tools you want:

```sh
brew bundle --file=./Brewfile
```

The Brewfile is a selected toolkit, not an export of every application on the author's machine. Optional plugins and tools are described in [adaptation.md](adaptation.md).

## 3. Choose which settings to apply

Read the settings first. Back up existing files before applying anything. The following commands explicitly use this clone, so they do not change an existing chezmoi source configuration:

```sh
chezmoi --source "$PWD" diff
# After reviewing the diff, apply only the files you want:
chezmoi --source "$PWD" apply ~/.config/starship.toml
# Or apply everything after making a backup:
chezmoi --source "$PWD" apply
```

Add your identity and private settings:

```sh
cp examples/gitconfig.local.example ~/.gitconfig.local
cp examples/zshrc.local.example ~/.zshrc.local
```

Do not overwrite these files if they already exist. Edit the copied examples to suit your environment.

## 4. Start with one tool

If Starship is already installed and initialized in your shell, you can try its theme alone:

```sh
chezmoi --source "$PWD" diff ~/.config/starship.toml
chezmoi --source "$PWD" apply ~/.config/starship.toml
```

Otherwise, add `eval "$(starship init zsh)"` to your own `.zshrc`, then open a new shell. Our `.zshrc` already loads Starship through its plugins module; do not initialize it a second time.

For other tools, review the directory's diff, then apply only that directory after making a backup:

```sh
chezmoi --source "$PWD" diff ~/.config/ghostty
chezmoi --source "$PWD" apply ~/.config/ghostty
# Or, for k9s on macOS:
chezmoi --source "$PWD" diff "$HOME/Library/Application Support/k9s"
```

Zsh is modular: copying `.zshrc` alone does not copy its modules. To adopt our shell, review and apply `.zshrc`, `.zshenv`, `.zprofile`, and `.config/zsh/` together. To keep your existing shell, copy only the aliases or functions you need.

## 5. Build the bat theme cache

After applying the bat configuration and its bundled theme, run:

```sh
bat cache --build
```

This makes the shared Catppuccin Mocha theme available to bat. btop, k9s, and Zed use their supplied theme files from their own configuration directories.

## 6. Check the application itself

| Tool | Manual check |
| --- | --- |
| Ghostty | Open a new window; check fonts, theme, and splits |
| Zsh / Starship | Open a new shell, enter a Git repository, and run `gst` |
| Neovim | Start `nvim`, allow plugins to install, then run `:checkhealth` |
| k9s | Check `k9s info`, then use an already authorized test context |
| tmux | Open a new `tmux` session, then test the Ctrl-A prefix |

A successful isolated startup does not validate Neovim plugins, graphical shortcuts, CRDs, or Kubernetes access. See [limitations and rollback](adaptation.md).
