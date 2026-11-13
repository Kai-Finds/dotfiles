# Zsh and Starship: commands and their context

[← Guides](../README.md) · [Zsh](https://www.zsh.org/) · [Starship](https://starship.rs/)

## Two projects, two roles

**Zsh** is the shell: it reads commands, expands aliases, runs programs, and handles command-line editing. **Starship** draws the prompt before a command, with directory, Git, or detected language information. Starship provides those capabilities; we choose their presentation.

## Our modular Zsh configuration

[`.zshrc`](../../home/dot_zshrc) loads files from the [Zsh directory](../../home/dot_config/zsh). You can edit aliases without working through the entire configuration.

| Module | Contents |
| --- | --- |
| `exports.zsh` | History, variables, and tool paths |
| `keybindings.zsh` | Editing and navigation shortcuts |
| `completion.zsh` | Completion initialization and presentation |
| `plugins.zsh` | Starship and loading of already installed plugins |
| `appearance.zsh` | Highlight styles and terminal title |
| `aliases.zsh` | Git, Kubernetes, and macOS tool shortcuts |
| `functions.zsh` | Navigation and small compound commands |
| `python-venv.zsh` | Directory-based virtual environment activation |

Some configured interactions:

| Command / key | What it does |
| --- | --- |
| `gst` | `git status` |
| `gl` | Git history as a graph |
| `kgp` | `kubectl get pod` in the active context |
| `kctx` | Show the active Kubernetes context |
| `mkcd demo` | Create `demo`, then enter it |
| `n` | Open the current directory in Neovim |
| Ctrl-R | Search history |
| Ctrl-A / Ctrl-E | Beginning / end of line |
| Option-← / Option-→ | Move by word, depending on the sequences emitted by the terminal |

Aliases remain ordinary commands: `kgp` requires kubectl and Kubernetes access; `ls` is replaced by eza. Functions using Git, fzf, bat, or Neovim require those programs.

## Our Starship prompt

The [Starship configuration](../../home/dot_config/starship.toml) chooses a Catppuccin Mocha palette, shortened paths, a blue branch, and peach Git status. The input arrow is green after success and red after an error.

Git indicators distinguish local changes, untracked files, and commits ahead of or behind the remote. Language modules activate according to recognized files and available tools.

Hostname, time, memory, and Kubernetes modules are disabled. The local-IP module remains enabled for SSH sessions: check it before publishing a remote-session screenshot. Glyphs require a suitable font.

**Reading example, not a reproduction of the graphical rendering:**

```text
my-project on main (Git status) via language-version
❯ command
```

Actual contents depend on the project and its state; no service inventory is hardcoded in the prompt.

## Try and adapt

From the clone, review and apply only the Starship file using the [installation guide](../installation.md). In a new shell, enter a Git repository and compare the prompt before and after changing directories. `starship explain` helps identify displayed modules.

Private settings belong in `~/.zshrc.local`, loaded at the end of our `.zshrc`. This file is not distributed.

## Known limitations

Suggestion and highlighting plugins are not bundled. Substring-history search bindings are conditional; this snapshot loads bindings before plugins, so it does not guarantee those bindings in a new shell. Ctrl-R remains available.

Python activation sources the script of a virtual environment found in the project: use it only in trusted directories. Some aliases can delete resources or change macOS settings; read their definitions before use.
