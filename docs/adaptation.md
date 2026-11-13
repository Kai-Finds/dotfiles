# Adaptations and limitations

## Differences from the original machine

- Sensitive values, SSH hosts, and Git identity are removed. Identity and secrets remain in ignored `.local` files.
- Account-specific paths are replaced with `$HOME` in shell files and `${HOME}` in npm; Ghostty's startup directory and k9s's dump directory use their defaults.
- An old version-specific Node path and a personal mail wrapper are removed.
- Cargo, wake, and Starship initialization is conditional; Zsh styles are initialized even without plugins. History-search bindings are conditional.
- The Git wrapper that rewrote global configuration is removed. Machine-specific performance settings and authentication helpers are not copied.
- tmux uses `pbcopy` on macOS, a native clock, and conditional TPM loading. The old Git status script is not distributed.
- The themed applications use Catppuccin Mocha. Refer to each configuration directory's README for theme files and dependencies.
- `.yarnrc` contained only generated metadata and is excluded.

## Optional dependencies

Zsh looks for already installed plugins under `~/.config/zsh-autosuggestions`, `~/.config/zsh-syntax-highlighting`, `~/.config/zsh-history-substring-search`, and `~/.config/zsh-you-should-use`. They are not bundled; the shell's basic functionality remains available without them. NVM, SDKMAN, Bun, Rust, Java, OrbStack, and wake are optional; aliases require the tools they invoke.

Neovim downloads lazy.nvim and its plugins on first launch, which requires network access. The LazyVim lockfile is retained. Neovim's configuration retains its original license in its directory. The checks here do not guarantee that every plugin, LSP, and extra works on a fresh machine.

Install TPM separately in `~/.tmux/plugins/tpm` to enable tmux plugins, then use its installation shortcut, `prefix + I`.

## k9s

The macOS location is preserved: `~/Library/Application Support/k9s`. On Linux, move these files to the directory reported by `k9s info`; Linux has not been validated.

Argo CD, cert-manager, Kyverno, and Prometheus aliases/views require the corresponding CRDs. Depending on the shortcut, plugins call stern, trivy, grype, popeye, pluto, jq, yq, or kubectl-who-can. They are not installed automatically.

`readOnly: false` is retained. **Shift-D and Shift-Z create debugging resources in the cluster**, including a privileged pod for node debugging. They run only when invoked. The Secret-decoding plugin displays sensitive data: do not share screenshots of its output. These plugins are not run during validation.

Kubernetes credentials, contexts, and `clusters/` data are never distributed.

## Trust in opened projects

The Zsh Python module automatically activates a virtual environment found in the current directory or its parents by sourcing its `bin/activate` script. Keep this only if you trust the projects you browse; otherwise remove `python-venv.zsh` from the modules loaded by `.zshrc`.

## Rollback

Restore files from your own backup, then open a new shell. This repository does not automatically create backups or a restore script. Never apply the entire snapshot before reviewing the diff.

## Documentation beside configuration

Every directory under `home/` has its own README. `home/.chezmoiignore` excludes READMEs from all destinations: explanations stay in the repository and only settings are installed.
