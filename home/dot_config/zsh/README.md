# Zsh: shell modules

[← Home](../../../README.md) · [Upstream project: Zsh](https://www.zsh.org/) · [Detailed guide](../../../docs/guides/shell.md)

Zsh interprets commands and provides line editing. We split its settings into eight modules loaded by the shared `.zshrc`.

| File | Contents |
| --- | --- |
| `exports.zsh` | Variables and paths |
| `keybindings.zsh` | Line editing and movement |
| `completion.zsh` | Completion display and cache |
| `plugins.zsh` | Starship and already installed optional plugins |
| `appearance.zsh` | Colors and title |
| `aliases.zsh` | Git, Kubernetes, and macOS aliases |
| `functions.zsh` | Small navigation and tooling functions |
| `python-venv.zsh` | Activation of a virtual environment found in the project |

Useful first tries: `gst` shows Git status; `mkcd demo` creates a directory and enters it; Ctrl-R searches history. `kgp` queries Kubernetes in the active context only when kubectl and access are available.

Install executables before using their aliases. Suggestion and highlighting plugins are not bundled. This snapshot loads bindings before plugins, so conditional substring-history bindings are not guaranteed in a new shell.

The Python module sources a project script: use it only with trusted directories. Some deletion aliases or macOS functions have real effects; read their definitions. Personal settings belong in `~/.zshrc.local`.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
