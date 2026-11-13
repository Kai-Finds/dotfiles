# k9s: views, aliases, and plugins

[← Home](../../../../README.md) · [Upstream project: k9s](https://k9scli.io/) · [Detailed guide](../../../../docs/guides/k9s.md)

[![Maintained by Kai Finds](https://img.shields.io/badge/maintained%20by-Kai%20Finds-00E5FF?style=flat-square&labelColor=0B0F14)](https://github.com/Kai-Finds)

k9s is a terminal interface for Kubernetes. Our files set its look and its navigation. They give you no cluster and no access rights.

| File | Contents |
| --- | --- |
| `config.yaml` | 2 s refresh, logs, thresholds, and Catppuccin Mocha theme |
| `aliases.yaml` | Short names, including `:po`, `:dp`, `:no`, and `:pvc` |
| `views.yaml` | Workload, image, resource, and operator columns |
| `jumps.yaml` | Navigation to related resources |
| `plugins.yaml` | Shortcuts to external utilities |
| `skins/` | Catppuccin Mocha transparent palette |

Example plugins: Shift-L calls stern, Shift-T Trivy, Shift-G Grype, and Shift-I kubectl/yq for Argo CD. Each needs its executable installed and the matching resources in the cluster. The full guide lists every shortcut and dependency.

**Shift-D and Shift-Z change the cluster.** They run debugging actions, and Shift-Z creates a privileged pod. Shift-B shows decoded Secret values. `readOnly: false` stays on: start in an authorized test context and read `plugins.yaml` first.

Destination: `~/Library/Application Support/k9s`. Check `k9s info` and your current context before you start. `clusters/` data, logs, backups and kubeconfig are excluded.

## Worth it, or skip it?

**✅ Worth it if**
- you want DevOps columns, jumps between related resources, and Trivy, Grype or stern one key away

**❌ Skip it if**
- you need a read-only k9s: this config keeps `readOnly: false`, and some shortcuts change the cluster or show Secrets

## Apply these settings

Read the [installation guide](../../../../docs/installation.md) and review the chezmoi diff before applying. READMEs stay in the repository; chezmoi never installs them.

---

<sub><b>Kai Finds</b> · Do more with AI · <a href="https://github.com/Kai-Finds">github.com/Kai-Finds</a> · <a href="https://kaifinds.sabaidev.la">kaifinds.sabaidev.la</a></sub>
