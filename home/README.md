# Settings installed in your home directory

[← Home](../README.md) · [Upstream project: chezmoi](https://www.chezmoi.io/) · [Detailed guide](../docs/installation.md)

| Source file | Destination | Role |
| --- | --- | --- |
| `dot_zshrc` | `~/.zshrc` | Zsh options, modules, and loading `.zshrc.local` |
| `dot_zshenv` | `~/.zshenv` | Default editor and Cargo initialization when available |
| `dot_zprofile` | `~/.zprofile` | macOS login environment and paths |
| `dot_profile` / `dot_bash_profile` | `~/.profile` / `~/.bash_profile` | Settings for other shell startup paths |
| `dot_gitconfig` | `~/.gitconfig` | Ignore rules and inclusion of local identity |
| `dot_npmrc` | `~/.npmrc` | npm prefix under the home directory |
| `dot_tmux.conf` | `~/.tmux.conf` | Ctrl-A prefix, panes, and Mocha tmux appearance |

Zsh, Git, npm, and tmux remain the upstream applications. Our files configure their behavior without supplying an account, key, or Git identity.

For tmux: Ctrl-A then `-` creates stacked panes, Ctrl-A then `m` zooms, and Ctrl-A then `r` reloads the configuration. TPM plugins require separate installation.

`.local` files are private and are not included in the repository. Application settings are under `dot_config/`; macOS k9s settings are under `Library/`.

## Apply these settings

Read the [installation guide](../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
