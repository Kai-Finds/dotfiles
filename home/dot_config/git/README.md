<img src="https://raw.githubusercontent.com/Kai-Finds/dotfiles/main/.github/kaifinds/dir-git.png" width="100%" alt="Kai Finds · dotfiles: Git: shared ignore rules">

# Git: shared ignore rules

[← Home](../../../README.md) · [Upstream project: Git](https://git-scm.com/docs/gitignore) · [Detailed guide](../../../docs/guides/autres-outils.md)

[![Maintained by Kai Finds](https://img.shields.io/badge/maintained%20by-Kai%20Finds-00E5FF?style=flat-square&labelColor=0B0F14)](https://github.com/Kai-Finds)

Our `ignore` file has one rule: `**/.claude/settings.local.json`. Your local Claude Code preferences stay out of commits by default.

Destination: `~/.config/git/ignore`. The repository's `home/dot_gitconfig` points to it through `core.excludesfile`. Copy the ignore file alone and Git never reads it.

Our `.gitconfig` also includes `~/.gitconfig.local`, for your name, commit email and credential helper. A template sits in `examples/` at the repository root. No credentials ship here.

One rule does not cover every secret. Review the diff and run a scan before you publish.

<a id="worth-it-or-skip-it"></a>
<img src="https://raw.githubusercontent.com/Kai-Finds/dotfiles/main/.github/kaifinds/worth-it.png" width="100%" alt="Worth it, or skip it?">

**✅ Worth it if**
- you use Claude Code and don't want its local settings in your commits

**❌ Skip it if**
- you expect a full secret filter: this is one rule, so keep scanning before you push

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. READMEs stay in the repository; chezmoi never installs them.

---

<sub><b>Kai Finds</b> · Do more with AI · <a href="https://github.com/Kai-Finds">github.com/Kai-Finds</a> · <a href="https://kaifinds.sabaidev.la">kaifinds.sabaidev.la</a></sub>
