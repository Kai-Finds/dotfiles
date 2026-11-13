# Ghostty : fenêtre, thème et raccourcis

[← Accueil](../../../README.md) · [Projet d’origine : Ghostty](https://ghostty.org/docs) · [Guide détaillé](../../../docs/guides/ghostty.md)

Ghostty fournit la fenêtre de terminal, les onglets, les splits et le rendu du texte. Notre fichier `config` choisit Catppuccin Mocha, une opacité de 0,85, JetBrains Mono à 20 pt et un curseur bloc sans clignotement.

| Touches | Réglage |
| --- | --- |
| Cmd-T | Nouvel onglet |
| Cmd-D | Split vers la droite |
| Cmd-Maj-D | Split vers le bas |
| Cmd-Maj-← / → | Changer d'onglet |
| Cmd-K | Effacer l'écran |

La souris change le focus et la sélection copie dans le presse-papiers. Adapter `font-size` et `background-opacity` selon sa lisibilité.

Destination : `~/.config/ghostty/config`. Le binaire et les polices doivent être installés séparément ; le Brewfile déclare Ghostty et une Nerd Font. Les options macOS ne garantissent pas le même résultat sur Linux.

## Appliquer ces réglages

Lire le [guide d’installation](../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
