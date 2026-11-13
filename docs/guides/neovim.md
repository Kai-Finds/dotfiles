# Neovim + LazyVim: our editing workspace

[← Guides](../README.md) · [Neovim](https://neovim.io/) · [LazyVim](https://www.lazyvim.org/) · [Our files](../../home/dot_config/nvim)

## The upstream foundation

Neovim is the editor. LazyVim is a Neovim configuration that already assembles plugins and conventions for editing, searching, and development tools. lazy.nvim manages plugins.

Completion, LSP integration, diagnostics, and standard LazyVim shortcuts are not features created by this repository. Our files add preferences to that foundation and enable extras.

## Our choices on top of LazyVim

| Choice | Result | File |
| --- | --- | --- |
| Transparent Catppuccin Mocha | Transparent editor and floating-window backgrounds | [ui.lua](../../home/dot_config/nvim/lua/plugins/ui.lua) |
| Lualine and status column disabled | A quieter interface | [ui.lua](../../home/dot_config/nvim/lua/plugins/ui.lua), [options.lua](../../home/dot_config/nvim/lua/config/options.lua) |
| Oil | Browse and edit a directory in a buffer, with hidden files visible | [editor.lua](../../home/dot_config/nvim/lua/plugins/editor.lua) |
| Snacks sidebar disabled | Navigation centered on Oil | [snacks.lua](../../home/dot_config/nvim/lua/plugins/snacks.lua) |
| On-demand Zen | Simplify the display when needed | [snacks.lua](../../home/dot_config/nvim/lua/plugins/snacks.lua) |
| k9s in a floating terminal + flatten.nvim | Route nested editing back to the host editor | [devops.lua](../../home/dot_config/nvim/lua/plugins/devops.lua) |
| Kulala, schema-companion, and actionlint | HTTP requests, YAML/Kubernetes schemas, and GitHub Actions linting | [devops.lua](../../home/dot_config/nvim/lua/plugins/devops.lua) |

## Useful interactions

In [LazyVim's conventions](https://www.lazyvim.org/keymaps), `<leader>` defaults to **Space**. The following shortcuts are used in normal mode.

| Keys | Origin | Action |
| --- | --- | --- |
| `Space`, then wait | LazyVim / which-key | Show possible key sequences |
| `-` | Our Oil declaration | Open the parent directory |
| `Space z` | Our Snacks declaration | Toggle Zen mode |
| `Space Z` | Our Snacks declaration | Toggle Zen zoom |
| `Space k` | Our integration | Open k9s in a floating terminal |
| `Space R s` | Our Kulala declaration | Run a request from an HTTP file |

In Oil, saving renames or deletions can apply them to the filesystem. Browsing with `-` is a good first try; editing its file list requires understanding how the plugin works.

The sidebar shortcuts `Space e`, `Space E`, `Space f e`, and `Space f E` are disabled here, so a standard LazyVim tutorial may show different navigation.

## How k9s integration works

`Space k` starts k9s with a `KUBE_EDITOR` aimed at the current Neovim instance. flatten.nvim receives nested editor openings. The configuration hides the k9s floating window during blocking edits, then restores it afterward.

This is the intended configuration behavior. It requires k9s, installed plugins, and a valid Kubernetes context; the repository's isolated check does not validate this workflow.

## Languages and installation

The [extras file](../../home/dot_config/nvim/lazyvim.json) enables Python, Go, Rust, TypeScript, YAML, Helm, Terraform, Docker, and Ansible, among others, plus testing, debugging, and the Claude Code extra. Enabling an extra does not provide an account, key, or its associated external tool.

On first launch, lazy.nvim and plugins must be downloaded. Versions are locked in `lazy-lock.json`. Automatic update checks are disabled; use `:Lazy check` for a manual check. Consult the [official LazyVim requirements](https://www.lazyvim.org/) for build tools and dependencies for the version in use.

To start without a cluster, open a repository file, use `-`, then `Space z`. Read `:checkhealth` results before treating the complete environment as operational.
