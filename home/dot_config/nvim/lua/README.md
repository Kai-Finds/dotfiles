# Lua : chargement et plugins Neovim

[← Accueil](../../../../README.md) · [Projet d’origine : Neovim](https://neovim.io/) · [Guide détaillé](../../../../docs/guides/neovim.md)

Neovim charge ses modules Lua depuis ce dossier. `init.lua` appelle `config.lazy`, qui configure le gestionnaire lazy.nvim et importe `plugins`.

- `config/` contient le démarrage et les options globales de notre configuration.
- `plugins/` contient nos préférences et intégrations, fusionnées avec la base LazyVim.

Modifier le module qui possède le comportement voulu. Un ajout de plugin et un réglage d'éditeur sont deux changements différents ; ils sont documentés dans les README des deux dossiers.

Les fichiers sont copiés dans `~/.config/nvim/lua`. Les README restent dans le dépôt et ne sont pas importés par Neovim.

## Appliquer ces réglages

Lire le [guide d’installation](../../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
