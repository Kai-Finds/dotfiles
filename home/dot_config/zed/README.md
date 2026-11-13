# Zed: a few visual preferences

[← Home](../../../README.md) · [Upstream project: Zed](https://zed.dev/) · [Detailed guide](../../../docs/guides/autres-outils.md)

[![Maintained by Kai Finds](https://img.shields.io/badge/maintained%20by-Kai%20Finds-00E5FF?style=flat-square&labelColor=0B0F14)](https://github.com/Kai-Finds)

Zed is a graphical editor, separate from Neovim. Our `settings.json` sets a 16 pt interface, 15 pt text, Catppuccin Mocha, and Zed's default icons.

The Mocha theme ships in `themes/catppuccin-mocha.json`. Destination: `~/.config/zed/settings.json`, theme under `~/.config/zed/themes/`. The settings file allows comments and trailing commas, so it is not strict JSON.

The Brewfile does not install Zed, and we have not checked how it renders. These preferences add no language server, account or service. Take them or leave them on their own.

## Worth it, or skip it?

**✅ Worth it if**
- you use Zed next to Neovim and want both in the same palette

**❌ Skip it if**
- you want a tuned Zed setup: this is fonts and a theme, nothing more

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. READMEs stay in the repository; chezmoi never installs them.

---

<sub><b>Kai Finds</b> · Do more with AI · <a href="https://github.com/Kai-Finds">github.com/Kai-Finds</a> · <a href="https://kaifinds.sabaidev.la">kaifinds.sabaidev.la</a></sub>
