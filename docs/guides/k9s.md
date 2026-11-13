# k9s: explore Kubernetes from the terminal

[← Guides](../README.md) · [Upstream project](https://k9scli.io/) · [Our files](../../home/Library/Application%20Support/k9s)

## The upstream project

k9s displays and manages Kubernetes resources in a terminal interface. Resource views, logs, filters, port-forwards, and plugin extensibility are provided by k9s.

Our repository chooses the appearance, columns, and shortcuts to external commands. It does not provide a cluster, kubeconfig, context, or access rights.

## Our settings

| File | Our configuration's contribution |
| --- | --- |
| `config.yaml` | Initial pods view, 2 s refresh, timestamped logs, CPU/memory thresholds of 70% and 90%, port-forward limited to 127.0.0.1 |
| `skins/catppuccin-mocha-transparent.yaml` | Catppuccin Mocha palette with a transparent background |
| `views.yaml` | Per-resource columns: images, usage, status, node, and DevOps information |
| `aliases.yaml` | Short names for workloads, storage, RBAC, and operator resources |
| `jumps.yaml` | Navigation from some resources to related resources |
| `plugins.yaml` | Calls to stern, scanners, RBAC tools, and kubectl commands |

CPU/memory values depend on data available in the cluster; our columns do not create metrics. Argo CD, cert-manager, Kyverno, and Prometheus views require their CRDs.

## Navigate with our aliases

In the k9s command bar, try `:po` for pods, `:dp` for deployments, `:no` for nodes, or `:pvc` for persistent volume claims. The alias mechanism comes from k9s; these names are declared in our file.

Configured jumps link an Argo CD application to pods in its destination namespace and a certificate to its associated Secret, among others. They depend on the resource structure and read permissions.

## Plugins: know what each key runs

These shortcuts depend on the selected resource. They invoke real programs and inherit the current context's permissions.

| Shortcut | Configured action | Required tool / effect |
| --- | --- | --- |
| Shift-L | Multi-pod logs with a selectable time range | stern |
| Shift-E | Description and recent events | kubectl |
| Shift-T | Scan container images | trivy; filters severities and ignores vulnerabilities without a fix |
| Shift-G | Scan container images | grype; limits results to fixable vulnerabilities |
| Shift-P | Namespace best-practice audit | popeye |
| Shift-V | Find deprecated APIs | pluto |
| Shift-W | List a ServiceAccount's permissions | kubectl; authorized impersonation required |
| Shift-H | Ask who can perform an operation | kubectl-who-can |
| Shift-I | Read Argo CD application status | kubectl and yq |
| Shift-B | Display base64-decoded Secret values | kubectl and jq; displays sensitive data |
| Shift-D | Add a netshoot debugging container to a pod | kubectl; **changes the cluster** |
| Shift-Z | Create a privileged debugging pod on a node | kubectl; **changes the cluster** |

Scan plugins use image references declared by the pod without explicitly resolving the running image digest. They do not, by themselves, prove the state of the exact deployed binary. Different Trivy/Grype filters prevent direct comparison of their counts.

`readOnly: false` is retained. Do not assume switching the interface to read-only blocks plugins: their commands and permissions also need to be controlled. None of these plugins is run by the repository check.

## First launch

On macOS, our files go to `~/Library/Application Support/k9s`. The [k9s documentation](https://k9scli.io/topics/config/) explains configuration locations; `k9s info` reports those used on your machine.

Check your context with `kubectl config current-context` before starting k9s. For a first look, use an already authorized test cluster and begin with views and aliases. Plugin utilities are optional and are not all installed by our Brewfile.

Never share screenshots containing Secrets, credentials, or private infrastructure names and addresses. See the [capture guide](../captures.md).
