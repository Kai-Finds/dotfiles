---
title: Document each configuration folder without installing its README
author: H4ckm1n
date: 2026-11-13
branch: main
id: l-3889ef97
scope: repo
status: active
src: agent
touches:
  - home/.chezmoiignore
  - tests/verify.py
---

## Decided
The user requires a README beside every configuration folder, so readers can learn directly while browsing the source. Keep these explanations in the repository without copying them into application configuration directories.

## Tried and ruled out
Guides only under docs are insufficient for this community workflow. Adding README files under the chezmoi source without ignore rules would also install documentation into the target home.

## Watch out
Keep the ignore rule under the effective source root selected by .chezmoiroot. A new application folder needs its own README, and installation verification must still exclude documentation at every depth.

In the code: home/.chezmoiignore excludes README.md and **/README.md. tests/verify.py checks the installed file set and asserts no README or .chezmoiignore appears in the isolated destination.
