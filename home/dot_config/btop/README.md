# btop: monitor resources

[← Home](../../../README.md) · [Upstream project: btop](https://github.com/aristocratos/btop) · [Detailed guide](../../../docs/guides/autres-outils.md)

btop is a terminal resource monitor. Our `btop.conf` selects Catppuccin Mocha, a transparent background, CPU/memory/network/process panels, the process tree, and a two-second update interval.

The selected theme is `catppuccin_mocha`; its file is included under `themes/`. Destination: `~/.config/btop/btop.conf`, with the theme under `~/.config/btop/themes/`. Install btop, then run `btop`. Data comes from the machine where it runs; this repository supplies no measurement history.

`save_config_on_exit = true` lets btop save setting changes on exit. A local configuration change is not automatically synchronized back to this repository.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
