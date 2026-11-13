---
title: Use English documentation and a shared Mocha palette
author: H4ckm1n
date: 2026-11-13
branch: main
id: l-a3dd106b
scope: repo
status: active
src: agent
touches:
  - README.md
  - home/dot_config/starship.toml
  - tests/verify.py
---

## Decided
The user corrected the community documentation language to English and requested Catppuccin Mocha across the shared tools, both in the repository and their local settings. Keep explanatory READMEs in English and use the same active palette across the terminal stack.

## Tried and ruled out
Keeping Macchiato for Starship, TokyoNight for k9s, or default themes for supporting tools would leave the shared setup visually inconsistent. Selecting a theme name alone is insufficient when a clean installation lacks its asset, so required official theme files and MIT notices are bundled at pinned upstream revisions.

## Watch out
A shared palette does not make every application interface identical. bat requires a cache rebuild after adding its theme. Zed supports local theme files but its GUI was unavailable for validation here. Preserve unrelated local preferences and back up existing files before changing theme selections; do not apply the entire public snapshot over the live configuration.

In the code: README.md and all configuration READMEs are English. home/dot_config/starship.toml embeds the Mocha palette; bat, btop, Zed and k9s have bundled Mocha assets. docs/theme-sources.json records upstream revisions and transformations. tests/verify.py checks theme selections, assets, and installation without README files.
