# Neovim : démarrage et options

[← Accueil](../../../../../README.md) · [Projet d’origine : LazyVim et lazy.nvim](https://www.lazyvim.org/configuration) · [Guide détaillé](../../../../../docs/guides/neovim.md)

LazyVim définit les options et conventions de base de l'éditeur. Ces deux fichiers gardent nos écarts explicites.

| Fichier | Notre configuration |
| --- | --- |
| `lazy.lua` | Télécharge lazy.nvim si absent, importe LazyVim puis `plugins`, désactive luarocks et les vérifications automatiques de mises à jour |
| `options.lua` | `pumblend = 0`, `winblend = 0` et `laststatus = 0` |

Les valeurs de blend à zéro participent au rendu des fenêtres flottantes avec le thème choisi. La suppression de la barre de statut nécessite aussi la désactivation de lualine dans `../plugins/ui.lua` ; modifier uniquement `laststatus` ne suffit pas à décrire l'ensemble de ce choix.

L'installation des plugins vient de lazy.nvim. Pour rechercher manuellement des mises à jour, utiliser `:Lazy check`. Vérifier les dépendances de la version LazyVim utilisée avant de considérer le premier démarrage comme validé.

## Appliquer ces réglages

Lire le [guide d’installation](../../../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
