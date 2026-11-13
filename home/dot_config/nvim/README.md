# Neovim : notre configuration LazyVim

[← Accueil](../../../README.md) · [Projet d’origine : Neovim et LazyVim](https://www.lazyvim.org/) · [Guide détaillé](../../../docs/guides/neovim.md)

Neovim est l'éditeur ; LazyVim fournit une base de plugins et de conventions. Nos fichiers choisissent une interface Catppuccin Mocha transparente, sans lualine ni sidebar Snacks, avec Oil pour la navigation.

| Fichier / dossier | Rôle |
| --- | --- |
| `init.lua` | Charge `config.lazy` |
| `lua/config/` | Démarrage lazy.nvim et options de l'éditeur |
| `lua/plugins/` | Nos ajouts et surcharges de plugins |
| `lazyvim.json` | Extras de langages, tests, debug et outils |
| `lazy-lock.json` | Versions verrouillées des plugins |
| `stylua.toml` | Formatage du Lua |
| `LICENSE` | Licence conservée dans la configuration d'origine |

En mode normal : `-` ouvre Oil, `Espace z` bascule Zen et `Espace k` lance k9s dans un flottant. Les capacités de ces plugins appartiennent à leurs auteurs ; notre code les assemble et règle leur comportement.

Au premier démarrage, un accès réseau est nécessaire pour télécharger les plugins. Les serveurs de langage et utilitaires demandent leurs propres dépendances. Commencer par un fichier de démonstration et `:checkhealth` ; l'intégration k9s nécessite aussi un contexte autorisé.

Destination : `~/.config/nvim`. Le test isolé n'exécute ni Neovim ni ses plugins.

## Appliquer ces réglages

Lire le [guide d’installation](../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
