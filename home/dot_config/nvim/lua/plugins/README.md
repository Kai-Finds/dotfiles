# Neovim : nos choix de plugins

[← Accueil](../../../../../README.md) · [Projet d’origine : LazyVim](https://www.lazyvim.org/) · [Guide détaillé](../../../../../docs/guides/neovim.md)

Ces déclarations sont des ajouts ou des surcharges de LazyVim. Les fonctionnalités appartiennent aux projets de plugins cités dans chaque fichier.

| Fichier | Choix présents |
| --- | --- |
| `editor.lua` | Oil avec fichiers cachés visibles ; lockfile.nvim |
| `ui.lua` | Catppuccin Mocha transparent ; transparence Tokyonight si utilisé ; lualine désactivé |
| `snacks.lua` | Sidebar et colonne de statut désactivées ; Zen ponctuel |
| `devops.lua` | k9s, flatten.nvim, Kulala, schémas YAML et actionlint |
| `lsp.lua` | Réglages Lua, Pyright et analyse `shadow` de gopls |
| `which-key.lua` | Présentation du menu de raccourcis |

En mode normal, le leader LazyVim par défaut est Espace : `-` ouvre Oil, `Espace z` active Zen, `Espace Z` zoome, `Espace k` ouvre k9s et `Espace R s` lance une requête HTTP via Kulala dans un fichier adapté.

Les raccourcis de sidebar sont désactivés : la navigation passe ici par Oil. Modifier sa liste de fichiers puis enregistrer peut modifier les vrais fichiers.

flatten.nvim est configuré pour renvoyer les éditions imbriquées vers l'instance hôte et masquer temporairement le flottant k9s. Ce parcours demande ses plugins, k9s et des accès Kubernetes ; il n'est pas exécuté par le test isolé.

## Appliquer ces réglages

Lire le [guide d’installation](../../../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
