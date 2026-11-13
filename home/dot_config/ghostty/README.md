# Ghostty: window, theme, and shortcuts

[← Home](../../../README.md) · [Upstream project: Ghostty](https://ghostty.org/docs) · [Detailed guide](../../../docs/guides/ghostty.md)

Ghostty provides the terminal window, tabs, splits, and text rendering. Our `config` selects Catppuccin Mocha, opacity 0.85, JetBrains Mono at 20 pt, and a non-blinking block cursor.

| Keys | Setting |
| --- | --- |
| Cmd-T | New tab |
| Cmd-D | Split to the right |
| Cmd-Shift-D | Split downward |
| Cmd-Shift-← / → | Switch tabs |
| Cmd-K | Clear the screen |

The mouse changes focus, and selecting text copies it to the clipboard. Adjust `font-size` and `background-opacity` for readability.

Destination: `~/.config/ghostty/config`. The application and fonts must be installed separately; the Brewfile declares Ghostty and a Nerd Font. macOS options do not guarantee the same result on Linux.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
