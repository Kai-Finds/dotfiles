# Application Support: k9s configuration

[← Home](../../../README.md) · [Upstream project: k9s](https://k9scli.io/topics/config/) · [Detailed guide](../../../docs/guides/k9s.md)

On macOS, k9s can read its configuration from `~/Library/Application Support/k9s`. This directory retains that location rather than forcing a Linux path under `.config`.

`k9s info` reports the paths used on your machine. The `k9s/` subdirectory contains its README, shared files, and theme. No other application directory from the machine is copied here.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
