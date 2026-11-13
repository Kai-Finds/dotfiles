# Lua: Neovim startup and plugins

[← Home](../../../../README.md) · [Upstream project: Neovim](https://neovim.io/) · [Detailed guide](../../../../docs/guides/neovim.md)

Neovim loads its Lua modules from here. `init.lua` calls `config.lazy`, which sets up lazy.nvim and imports `plugins`.

- `config/`: startup and global options.
- `plugins/`: our preferences and integrations, merged into the LazyVim base.

Change the module that owns the behavior. A new plugin and a new editor option are different changes; each directory's README explains its side.

Files are copied to `~/.config/nvim/lua`. Neovim never imports the READMEs.

## Apply these settings

Read the [installation guide](../../../../docs/installation.md) and review the chezmoi diff before applying. READMEs stay in the repository; chezmoi never installs them.

---

<sub><b>Kai Finds</b> · Do more with AI · <a href="https://github.com/Kai-Finds">github.com/Kai-Finds</a> · <a href="https://kaifinds.sabaidev.la">kaifinds.sabaidev.la</a></sub>
