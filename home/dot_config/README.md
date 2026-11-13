# Application configurations

[← Home](../../README.md) · [Upstream project: chezmoi](https://www.chezmoi.io/) · [Detailed guide](../../docs/README.md)

Each subdirectory corresponds to an application. `dot_config` becomes `~/.config` when chezmoi applies the files.

| Item | Purpose |
| --- | --- |
| `starship.toml` | Catppuccin Mocha prompt, short paths, Git branch and status |
| `zsh/` | Shell modules and aliases |
| `ghostty/` | Terminal window appearance and shortcuts |
| `nvim/` | Neovim configuration based on LazyVim |
| `bat/`, `btop/`, `git/`, `zed/` | Independent preferences, explained in each README |

Starship builds the prompt; our file chooses its palette and modules. Install Starship and initialize it in your shell to use it. Our Zsh configuration does this in `plugins.zsh`.

Hostname, time, memory, and Kubernetes context are hidden in the prompt. Language indicators depend on the project and available executables. Read `starship.toml` to adapt these choices.

To try Starship alone from the clone's root, run `chezmoi --source "$PWD" diff ~/.config/starship.toml`, then apply the file after making a backup. You do not need to adopt every directory together.

## Apply these settings

Read the [installation guide](../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
