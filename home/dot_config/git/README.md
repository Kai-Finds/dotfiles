# Git: shared ignore rules

[← Home](../../../README.md) · [Upstream project: Git](https://git-scm.com/docs/gitignore) · [Detailed guide](../../../docs/guides/autres-outils.md)

Git provides version control and ignore mechanisms. Our `ignore` file ignores `**/.claude/settings.local.json` to avoid adding those local preferences by default.

Destination: `~/.config/git/ignore`. The repository's `home/dot_gitconfig` references this path through `core.excludesfile`; copying the ignore file alone does not configure that reference.

Our `.gitconfig` also includes `~/.gitconfig.local`, where you can set your name, commit email, and authentication helper. A template is provided in `examples/` at the repository root. No credentials are distributed.

This ignore rule does not cover every secret. Review the diff and run a scan before publishing.

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. README files remain in the repository and are excluded from installation.
