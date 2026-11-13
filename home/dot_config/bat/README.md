# bat: view files

[← Home](../../../README.md) · [Upstream project: bat](https://github.com/sharkdp/bat) · [Detailed guide](../../../docs/guides/autres-outils.md)

[![Maintained by Kai Finds](https://img.shields.io/badge/maintained%20by-Kai%20Finds-00E5FF?style=flat-square&labelColor=0B0F14)](https://github.com/Kai-Finds)

bat is `cat` with syntax highlighting. Our `config` turns on the `numbers,changes` style (line numbers and change markers) in Catppuccin Mocha.

The Mocha theme ships under `themes/`. After applying, run `bat cache --build` so bat finds it, then try `bat README.md` in any repository.

Destination: `~/.config/bat/config`, theme under `~/.config/bat/themes/`. Install bat separately. The Zsh `bcat` alias drops paging and decorations for plain reading.

## Worth it, or skip it?

**✅ Worth it if**
- you read code in the terminal and want line numbers and Git change markers

**❌ Skip it if**
- you pipe file contents into other tools: use `bcat` or plain `cat` there

## Apply these settings

Read the [installation guide](../../../docs/installation.md) and review the chezmoi diff before applying. READMEs stay in the repository; chezmoi never installs them.

---

<sub><b>Kai Finds</b> · Do more with AI · <a href="https://github.com/Kai-Finds">github.com/Kai-Finds</a> · <a href="https://kaifinds.sabaidev.la">kaifinds.sabaidev.la</a></sub>
