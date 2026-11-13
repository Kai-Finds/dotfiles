# Ghostty : la fenêtre du terminal

[← Guides](../README.md) · [Projet d'origine](https://ghostty.org/docs) · [Notre configuration](../../home/dot_config/ghostty/config)

## Le projet d'origine

Ghostty est un émulateur de terminal : il affiche le texte des applications et transmet les touches. Il fournit notamment fenêtres, onglets, divisions de fenêtre et personnalisation de l'affichage. Son interface native et son rendu accéléré appartiennent au logiciel d'origine.

Le shell tourne dans cette fenêtre. Changer Ghostty ne remplace pas Zsh, et changer le thème Ghostty ne redéfinit pas le contenu du prompt Starship.

## Nos réglages

| Réglage | Valeur distribuée | Effet recherché |
| --- | --- | --- |
| Thème | Catppuccin Mocha | Couleurs sombres |
| Fond | Opacité 0,85 ; flou 0 | Voir légèrement le fond sans flou ajouté |
| Police | JetBrains Mono, 20 pt | Texte large avec ligatures |
| Glyphes | Certains symboles via JetBrainsMono Nerd Font | Icônes de terminal si les polices sont présentes |
| Marges | 12 horizontalement, 8 verticalement | Espacer le texte du bord |
| Curseur | Bloc, sans clignotement | Repère visuel stable |
| Focus | Suit la souris | Changer le panneau actif au survol |
| Sélection | Copie dans le presse-papiers | Copier un texte en le sélectionnant |
| Répertoire | Hérité du terminal courant | Garder le contexte lors de l'ouverture d'une surface |

Ces préférences ne sont pas un benchmark de performance. Une transparence de 85 % et `minimum-contrast = 1.0` peuvent diminuer la lisibilité selon le fond : augmenter l'opacité ou adapter le contraste si nécessaire.

## Raccourcis configurés

| Touches sur macOS | Action |
| --- | --- |
| Cmd-T | Nouvel onglet |
| Cmd-W | Fermer la surface active |
| Cmd-D | Diviser vers la droite |
| Cmd-Maj-D | Diviser vers le bas |
| Cmd-Maj-← / → | Onglet précédent / suivant |
| Cmd-K | Effacer l'écran |
| Cmd-Maj-K | Réinitialiser le terminal |
| Cmd-+ / Cmd-- / Cmd-0 | Agrandir / réduire / rétablir la police |

Ces commandes sont des actions natives de Ghostty auxquelles notre fichier attribue des touches. Le terminal rapide est configuré en haut de l'écran ; aucun raccourci global pour l'ouvrir n'est défini dans ce fichier.

## Premier essai

Lire le diff puis appliquer le dossier Ghostty selon le [guide d'installation](../installation.md). Ouvrir une nouvelle fenêtre et tester Cmd-D : le nouveau panneau doit apparaître à droite. Exécuter `pwd` dans chaque panneau aide à comprendre le répertoire de travail hérité.

Pour personnaliser l'apparence, commencer par `font-size`, `background-opacity` et `theme`. Le thème de Neovim et la palette Starship sont réglés dans leurs propres fichiers.

## Ce qui n'est pas fourni

Le dépôt ne contient ni le binaire Ghostty ni les polices. Le Brewfile déclare Ghostty et une Nerd Font ; la résolution exacte des noms de police dépend de l'installation. Les options sont prévues pour macOS et restent sensibles à la version de Ghostty utilisée.
