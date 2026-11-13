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

Zsh, Git, npm and tmux are the upstream apps. Our files set how they behave. No account, key or Git identity ships with them.

tmux in three keys: Ctrl-A then `-` stacks a pane, Ctrl-A then `m` zooms, Ctrl-A then `r` reloads the config. TPM plugins install separately.

`.local` files are private and never in the repository. App settings live under `dot_config/`, macOS k9s settings under `Library/`.

## Apply these settings

Read the [installation guide](../docs/installation.md) and review the chezmoi diff before applying. READMEs stay in the repository; chezmoi never installs them.

---

<sub><b>Kai Finds</b> · Do more with AI · <a href="https://github.com/Kai-Finds">github.com/Kai-Finds</a> · <a href="https://kaifinds.sabaidev.la">kaifinds.sabaidev.la</a></sub>
