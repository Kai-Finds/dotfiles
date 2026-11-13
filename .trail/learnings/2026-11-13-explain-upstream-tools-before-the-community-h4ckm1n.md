---
title: Explain upstream tools before the community customizations
author: H4ckm1n
date: 2026-11-13
branch: main
id: l-baafcf4c
scope: repo
status: active
src: agent
touches:
  - README.md
  - docs/README.md
---

## Decided
README.md and the guides explain what each upstream tool provides before describing our configuration. The user wants teaching material for the community, so readers must be able to distinguish the terminal, shell, prompt, editor and Kubernetes interface, then adopt one piece at a time.

## Tried and ruled out
A list of distributed files alone does not explain the setup. Do not attribute LazyVim features or native Ghostty capabilities to our dotfiles, or present an illustrative mockup as a real screenshot.

## Watch out
Use screenshots of the distributed snapshot with demonstration data. Live settings may differ from the public snapshot, and a production k9s screen can expose private infrastructure or Secret values. If capture access is unavailable, leave the image out and document the actual limitation.

In the code: README.md maps upstream projects to our choices; docs/guides/ contains source-linked explanations and shortcut tables. docs/captures.md defines real demonstration scenes; docs/installation.md keeps progressive setup separate from the overview.
