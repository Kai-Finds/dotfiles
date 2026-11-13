# Lua: Neovim startup and plugins

[← Home](../../../../README.md) · [Upstream project: Neovim](https://neovim.io/) · [Detailed guide](../../../../docs/guides/neovim.md)

Neovim loads its Lua modules from this directory. `init.lua` calls `config.lazy`, which configures the lazy.nvim manager and imports `plugins`.

- `config/` contains startup and global options for our configuration.
- `plugins/` contains our preferences and integrations, merged with the LazyVim foundation.

Edit the module that owns the behavior you want to change. Adding a plugin and changing an editor setting are different changes; the two directories' READMEs explain them.

Files are copied to `~/.config/nvim/lua`. READMEs remain in the repository and are not imported by Neovim.

## Apply these settings

Read the [installation guide](../../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
