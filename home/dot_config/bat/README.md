# bat: view files

[← Home](../../../README.md) · [Upstream project: bat](https://github.com/sharkdp/bat) · [Detailed guide](../../../docs/guides/autres-outils.md)

bat provides syntax-highlighted file display in the terminal. Our `config` enables the `numbers,changes` style: line numbers and change indicators, using Catppuccin Mocha.

The Mocha theme is included under `themes/`. After applying it, run `bat cache --build` so bat can load the theme, then try `bat README.md` from a repository.

Destination: `~/.config/bat/config`, with the theme under `~/.config/bat/themes/`. Install bat separately. The Zsh `bcat` alias removes pagination and decorations for simpler reading.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
