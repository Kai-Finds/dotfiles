# Illustrate the guides with Ghostty

[← Guides](README.md)

Screenshots should show the actual shared settings, with captions that distinguish upstream capabilities from our choices. No screenshots are included yet: the capture tool in the writing session could not access Ghostty.

## Prepare the scene

Use a demonstration directory with a non-sensitive file and, for Starship, a test Git repository. Do not capture private infrastructure or client projects. Close other tabs and avoid exposing command history.

Show the settings from this repository actually applied. If you use an additional extension or theme, state that in the caption so the image does not promise an appearance the repository cannot provide.

On macOS, press **Cmd-Shift-4**, then **Space**, and click the Ghostty window to capture it. Review the entire image before placing it in `docs/images/` and adding a Markdown link. Do not publish images where private information is merely covered by another interface element.

## Screenshots that explain something

| Suggested file | Real scene | Caption to adapt after observation |
| --- | --- | --- |
| `ghostty-shell.png` | A shell in a demonstration repository | “Ghostty provides the window; our settings choose Mocha and opacity. Zsh interprets commands; Starship displays the Git branch with our Mocha palette.” |
| `ghostty-splits.png` | Two panes after Cmd-D | “Splits are a Ghostty feature. Our file binds a right split to Cmd-D and a downward split to Cmd-Shift-D.” |
| `neovim-oil.png` | Neovim on a demo file with Oil navigation | “LazyVim provides the editor foundation. Our settings choose Oil, a transparent theme, and a hidden status line.” |
| `k9s-demo.png` | A pods view in a local demonstration cluster | “k9s provides the Kubernetes view; our settings choose Catppuccin Mocha and the displayed columns. Data comes from the test cluster.” |

Do not open a production cluster just to capture k9s. If no test cluster is available, omit that screenshot. Never open the Secret-decoding plugin to illustrate the interface.

## Attribute capabilities to the correct project

Include the application's name, visible settings, and demonstration context. A before/after comparison should use the same directory, Git state, dimensions, and application version; only the settings being compared should change.

Example insertion, only after creating and reviewing the file:

```markdown
![Ghostty with the Starship prompt in a demonstration repository](images/ghostty-shell.png)

Ghostty + Zsh + Starship. Catppuccin Mocha throughout; demonstration data.
```
