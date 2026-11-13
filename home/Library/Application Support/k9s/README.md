# k9s: views, aliases, and plugins

[← Home](../../../../README.md) · [Upstream project: k9s](https://k9scli.io/) · [Detailed guide](../../../../docs/guides/k9s.md)

k9s provides a terminal interface for Kubernetes resources. Our configuration chooses its appearance and navigation conventions; it supplies neither a cluster nor access rights.

| File | Contents |
| --- | --- |
| `config.yaml` | 2 s refresh, logs, thresholds, and Catppuccin Mocha theme |
| `aliases.yaml` | Short names, including `:po`, `:dp`, `:no`, and `:pvc` |
| `views.yaml` | Workload, image, resource, and operator columns |
| `jumps.yaml` | Navigation to related resources |
| `plugins.yaml` | Shortcuts to external utilities |
| `skins/` | Catppuccin Mocha transparent palette |

Example plugins: Shift-L calls stern, Shift-T Trivy, Shift-G Grype, and Shift-I kubectl/yq for Argo CD. Executables must be installed and corresponding resources must exist. The complete guide lists every shortcut and dependency.

**Shift-D and Shift-Z change the cluster** by running debugging actions; Shift-Z creates a privileged pod. Shift-B displays decoded Secret values. `readOnly: false` is retained: start with an authorized test context and read `plugins.yaml` before use.

Destination: `~/Library/Application Support/k9s`. Check `k9s info` and your context before starting. `clusters/` data, logs, backups, and kubeconfig remain excluded.

## Apply these settings

Read the [installation guide](../../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
