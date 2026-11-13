# Neovim: our LazyVim configuration

[← Home](../../../README.md) · [Upstream project: Neovim and LazyVim](https://www.lazyvim.org/) · [Detailed guide](../../../docs/guides/neovim.md)

Neovim is the editor; LazyVim supplies a foundation of plugins and conventions. Our files choose a transparent Catppuccin Mocha interface without lualine or the Snacks sidebar, using Oil for navigation.

| File / directory | Role |
| --- | --- |
| `init.lua` | Loads `config.lazy` |
| `lua/config/` | lazy.nvim startup and editor options |
| `lua/plugins/` | Our plugin additions and overrides |
| `lazyvim.json` | Language, testing, debugging, and tooling extras |
| `lazy-lock.json` | Locked plugin versions |
| `stylua.toml` | Lua formatting |
| `LICENSE` | License retained from the original configuration |

In normal mode, `-` opens Oil, `Space z` toggles Zen, and `Space k` starts k9s in a floating window. These plugins' capabilities belong to their authors; our code assembles and configures them.

First startup requires network access to download plugins. Language servers and utilities require their own dependencies. Begin with a demonstration file and `:checkhealth`; k9s integration also requires an authorized context.

Destination: `~/.config/nvim`. The isolated check does not run Neovim or its plugins.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
