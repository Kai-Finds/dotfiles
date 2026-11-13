# Other shared tools

[← Guides](../README.md)

These settings are independent: you do not need to adopt tmux or Zed to use our Starship prompt.

## tmux: terminal sessions

[tmux](https://github.com/tmux/tmux/wiki) provides sessions, windows, and panes managed inside the terminal. Ghostty splits belong to the application window; tmux panes belong to a tmux session.

[Our file](../../home/dot_tmux.conf) moves the status bar to the top, enables the mouse, uses explicit Mocha foreground and accent colors, and changes the prefix to **Ctrl-A**. For the following commands, press Ctrl-A, release it, then type the second key.

| Sequence | Configured action |
| --- | --- |
| Ctrl-A then `\|` | Split into side-by-side panes |
| Ctrl-A then `-` | Split into stacked panes |
| Ctrl-A then `m` | Zoom / restore the active pane |
| Ctrl-A then `r` | Reload `.tmux.conf` |
| Ctrl-A then `h`, `j`, `k`, `l` | Resize a pane |
| Ctrl-A then Ctrl-S | Enable / disable synchronized pane input |

Synchronization sends the same commands to several panes: check the affected sessions before enabling it. In vi copy mode, `y` copies using `pbcopy` on macOS.

TPM and navigation, theme, and restoration plugins are declared but not downloaded by this repository. Install [TPM](https://github.com/tmux-plugins/tpm) separately to use them. Without TPM, the base configuration remains loadable; declaring restoration plugins alone does not guarantee session restoration.

## bat, btop, and Zed

| Upstream application | Our setting | File |
| --- | --- | --- |
| [bat](https://github.com/sharkdp/bat): file viewer with syntax highlighting | Catppuccin Mocha, line numbers, and changes | [config](../../home/dot_config/bat/config) |
| [btop](https://github.com/aristocratos/btop): resource monitor | Catppuccin Mocha, transparent background, process tree, and 2 s refresh | [btop.conf](../../home/dot_config/btop/btop.conf) |
| [Zed](https://zed.dev/): graphical editor | Catppuccin Mocha, 16 pt interface, and 15 pt text | [settings.json](../../home/dot_config/zed/settings.json) |

Each theme must be available to its application; see the corresponding configuration directory's README. Zed is not installed by the Brewfile; its preferences are shared independently.

## Git and npm

[Our `.gitconfig`](../../home/dot_gitconfig) sets a global ignore file and includes `~/.gitconfig.local`. It configures neither a commit identity nor an authentication helper. Copy the [identity template](../../examples/gitconfig.local.example) and adapt it to your account.

[The ignore file](../../home/dot_config/git/ignore) ignores local Claude settings in repositories. This does not replace reviewing files before committing.

[Our `.npmrc`](../../home/dot_npmrc) moves the global npm installation prefix to `~/.npm-global`; the shell adds its `bin` directory to PATH. This choice may interact with Node version managers: keep it only if it matches how you manage Node.
