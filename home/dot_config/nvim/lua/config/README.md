# Neovim: startup and options

[← Home](../../../../../README.md) · [Upstream project: LazyVim and lazy.nvim](https://www.lazyvim.org/configuration) · [Detailed guide](../../../../../docs/guides/neovim.md)

LazyVim defines the editor's base options and conventions. These two files keep our differences explicit.

| File | Our configuration |
| --- | --- |
| `lazy.lua` | Downloads lazy.nvim if absent, imports LazyVim then `plugins`, disables luarocks and automatic update checks |
| `options.lua` | `pumblend = 0`, `winblend = 0`, and `laststatus = 0` |

Zero blend values contribute to floating-window rendering with the chosen theme. Hiding the status line also requires disabling lualine in `../plugins/ui.lua`; changing `laststatus` alone does not describe the entire choice.

Plugin installation comes from lazy.nvim. Use `:Lazy check` to check for updates manually. Check the requirements of your LazyVim version before considering first startup validated.

## Apply these settings

Read the [installation guide](../../../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
