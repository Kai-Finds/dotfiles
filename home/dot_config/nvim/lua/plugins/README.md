# Neovim: our plugin choices

[← Home](../../../../../README.md) · [Upstream project: LazyVim](https://www.lazyvim.org/) · [Detailed guide](../../../../../docs/guides/neovim.md)

These files add to LazyVim or override it. The features belong to the plugin projects named in each file.

| File | Choices |
| --- | --- |
| `editor.lua` | Oil with hidden files visible; lockfile.nvim |
| `ui.lua` | Transparent Catppuccin Mocha; lualine disabled |
| `snacks.lua` | Sidebar and status column disabled; on-demand Zen |
| `devops.lua` | k9s, flatten.nvim, Kulala, YAML schemas, and actionlint |
| `lsp.lua` | Lua and Pyright settings, plus gopls `shadow` analysis |
| `which-key.lua` | Shortcut menu presentation |

Leader is Space, as in LazyVim. In normal mode: `-` opens Oil, `Space z` Zen, `Space Z` zoom, `Space k` k9s, and `Space R s` sends an HTTP request through Kulala from a suitable file.

Sidebar shortcuts are off: Oil handles navigation. Careful: edit Oil's file list and save, and real files change.

flatten.nvim sends nested edits to the host Neovim and hides the k9s floating window while you edit. That flow needs its plugins, k9s and Kubernetes access. The isolated test does not run it.

## Apply these settings

Read the [installation guide](../../../../../docs/installation.md) and review the chezmoi diff before applying. READMEs stay in the repository; chezmoi never installs them.

---

<sub><b>Kai Finds</b> · Do more with AI · <a href="https://github.com/Kai-Finds">github.com/Kai-Finds</a> · <a href="https://kaifinds.sabaidev.la">kaifinds.sabaidev.la</a></sub>
