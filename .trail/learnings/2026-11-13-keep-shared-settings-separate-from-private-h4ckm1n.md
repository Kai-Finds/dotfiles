---
title: Keep shared settings separate from private machine state
author: H4ckm1n
date: 2026-11-13
id: l-1b586878
scope: repo
status: active
src: agent
touches:
  - README.md
  - docs/adaptation.md
---

## Decided
README.md documents a separate chezmoi snapshot because the live application folders mix reusable settings with credentials, sessions and project data. Private overrides stay outside this repository.

## Tried and ruled out
Publishing the existing chezmoi source wholesale would also publish machine-specific assistant hooks and automation. Bulk importing the home directory would include credentials and caches.

## Watch out
The public snapshot and live setup evolve independently. Audit additions individually. docs/adaptation.md records that the k9s debug shortcuts create cluster resources, despite the original plugin header claiming otherwise.

In the code: README.md explains the explicit chezmoi --source workflow; .chezmoiroot limits installation to home/. Tests run with python3 tests/verify.py. Scan before publishing with gitleaks dir . --redact.
