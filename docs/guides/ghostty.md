# Ghostty: the terminal window

[← Guides](../README.md) · [Upstream project](https://ghostty.org/docs) · [Our configuration](../../home/dot_config/ghostty/config)

## The upstream project

Ghostty is a terminal emulator: it displays application output and forwards key presses. It provides windows, tabs, splits, and appearance settings. Its native interface and accelerated rendering belong to the upstream application.

The shell runs inside this window. Changing Ghostty does not replace Zsh, and changing the Ghostty theme does not redefine the contents of the Starship prompt.

## Our settings

| Setting | Distributed value | Intended effect |
| --- | --- | --- |
| Theme | Catppuccin Mocha | Dark colors shared with the rest of the setup |
| Background | Opacity 0.85; blur 0 | A slightly visible background without added blur |
| Font | JetBrains Mono, 20 pt | Large text with ligatures |
| Glyphs | Some symbols use JetBrainsMono Nerd Font | Terminal icons when the fonts are available |
| Padding | 12 horizontal, 8 vertical | Space between text and window edges |
| Cursor | Block, no blinking | A stable visual reference |
| Focus | Follows the mouse | Switch the active pane by hovering |
| Selection | Copies to clipboard | Copy text by selecting it |
| Directory | Inherited from the current terminal | Retain context when opening a surface |

These preferences are not a performance benchmark. An opacity of 85% and `minimum-contrast = 1.0` may reduce readability depending on the background: increase opacity or adjust contrast if needed.

## Configured shortcuts

| macOS keys | Action |
| --- | --- |
| Cmd-T | New tab |
| Cmd-W | Close the active surface |
| Cmd-D | Split to the right |
| Cmd-Shift-D | Split downward |
| Cmd-Shift-← / → | Previous / next tab |
| Cmd-K | Clear the screen |
| Cmd-Shift-K | Reset the terminal |
| Cmd-+ / Cmd-- / Cmd-0 | Increase / decrease / reset font size |

These are native Ghostty actions assigned keys by our file. The quick terminal is configured at the top of the screen; this file does not define a global shortcut to open it.

## First try

Review the diff and apply the Ghostty directory using the [installation guide](../installation.md). Open a new window and try Cmd-D: the new pane should appear on the right. Running `pwd` in each pane helps explain inherited working directories.

To customize the appearance, start with `font-size`, `background-opacity`, and `theme`. Neovim's theme and Starship's palette are configured in their own files.

## What is not included

The repository contains neither the Ghostty binary nor its fonts. The Brewfile declares Ghostty and a Nerd Font; exact font-name resolution depends on the installation. These options target macOS and depend on the Ghostty version in use.
