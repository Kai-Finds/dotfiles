# Zed: a few visual preferences

[← Home](../../../README.md) · [Upstream project: Zed](https://zed.dev/) · [Detailed guide](../../../docs/guides/autres-outils.md)

Zed is a graphical editor independent of Neovim. Our `settings.json` selects a 16 pt interface, 15 pt text, Catppuccin Mocha, and Zed's default icons.

The Mocha theme is included in `themes/catppuccin-mocha.json`. Destination: `~/.config/zed/settings.json`, with the theme under `~/.config/zed/themes/`. Settings support comments and trailing commas, so do not treat this file as strict JSON.

Zed is not installed by the Brewfile, and its graphical rendering has not been validated here. These preferences do not add a language server, account, or service connection. They can be adopted independently of the remaining dotfiles.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
