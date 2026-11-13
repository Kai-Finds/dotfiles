# k9s: the Catppuccin Mocha theme

[← Home](../../../../../README.md) · [Upstream project: k9s and Catppuccin](https://k9scli.io/topics/skins/) · [Detailed guide](../../../../../docs/guides/k9s.md)

k9s provides a skin mechanism. Our shared `catppuccin-mocha-transparent.yaml` defines colors for tables, prompts, logs, dialogs, and borders, with a transparent background.

The parent `config.yaml` selects this theme with `ui.skin: catppuccin-mocha-transparent`. Installing the file without selecting its name in the configuration does not activate it.

Destination: `~/Library/Application Support/k9s/skins/catppuccin-mocha-transparent.yaml`. Mocha matches the shared palette used by Ghostty and Starship, while each application's interface remains its own. The skin does not change columns, Kubernetes permissions, or available commands.

## Apply these settings

Read the [installation guide](../../../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
