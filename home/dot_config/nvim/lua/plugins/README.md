# Neovim: our plugin choices

[← Home](../../../../../README.md) · [Upstream project: LazyVim](https://www.lazyvim.org/) · [Detailed guide](../../../../../docs/guides/neovim.md)

These declarations add to or override LazyVim. Features belong to the plugin projects named in each file.

| File | Choices |
| --- | --- |
| `editor.lua` | Oil with hidden files visible; lockfile.nvim |
| `ui.lua` | Transparent Catppuccin Mocha; lualine disabled |
| `snacks.lua` | Sidebar and status column disabled; on-demand Zen |
| `devops.lua` | k9s, flatten.nvim, Kulala, YAML schemas, and actionlint |
| `lsp.lua` | Lua and Pyright settings, plus gopls `shadow` analysis |
| `which-key.lua` | Shortcut menu presentation |

In normal mode, the default LazyVim leader is Space: `-` opens Oil, `Space z` enables Zen, `Space Z` zooms, `Space k` opens k9s, and `Space R s` runs an HTTP request through Kulala in a suitable file.

Sidebar shortcuts are disabled: navigation uses Oil here. Editing its file list and saving can change real files.

flatten.nvim is configured to route nested editing to the host instance and temporarily hide the k9s floating window. This workflow requires its plugins, k9s, and Kubernetes access; it is not run by the isolated check.

## Apply these settings

Read the [installation guide](../../../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
