# Illustrer les guides avec Ghostty

[← Guides](README.md)

Les captures doivent montrer le rendu réel des fichiers partagés, avec une légende qui distingue la capacité du logiciel d'origine et notre réglage. Aucun screenshot n'est inclus à ce stade : l'outil de capture de la session de rédaction ne pouvait pas accéder à Ghostty.

## Préparer la scène

Utiliser un dossier de démonstration avec un fichier non sensible et, pour Starship, un dépôt Git de test. Ne pas prendre de captures d'une infrastructure privée ou d'un projet client. Fermer les autres onglets et éviter de laisser apparaître l'historique.

Afficher les réglages de ce dépôt effectivement appliqués. Si une extension ou un thème supplémentaire est utilisé, l'indiquer dans la légende pour ne pas promettre un rendu que le dépôt ne fournit pas.

Sur macOS, utiliser **Cmd-Maj-4**, puis **Espace** et cliquer sur la fenêtre Ghostty pour capturer sa fenêtre. Vérifier l'image entière avant de la placer dans `docs/images/` et de créer un lien Markdown. Ne pas publier d'images où des informations privées sont simplement cachées par un élément d'interface.

## Captures qui expliquent quelque chose

| Fichier proposé | Scène réelle | Légende à adapter après observation |
| --- | --- | --- |
| `ghostty-shell.png` | Un shell dans un dépôt de démonstration | « Ghostty affiche la fenêtre ; notre configuration choisit Mocha et l'opacité. Zsh interprète les commandes ; Starship affiche la branche Git avec notre palette Macchiato. » |
| `ghostty-splits.png` | Deux panneaux après Cmd-D | « Les splits sont une fonction Ghostty. Notre fichier les associe à Cmd-D vers la droite et Cmd-Maj-D vers le bas. » |
| `neovim-oil.png` | Neovim sur un fichier de démo et navigation Oil | « LazyVim fournit la base de l'éditeur. Notre configuration choisit Oil, un thème transparent et masque la barre de statut. » |
| `k9s-demo.png` | Vue pods dans un cluster local de démonstration | « k9s fournit la vue Kubernetes ; notre fichier choisit TokyoNight et les colonnes affichées. Les données viennent du cluster de test. » |

Pour k9s, ne pas ouvrir un cluster de production pour produire l'image. Si aucun cluster de test n'est disponible, laisser cette capture de côté. Ne jamais ouvrir le plugin de décodage de Secrets pour illustrer l'interface.

## Légender sans attribuer les fonctions au mauvais projet

Indiquer le nom du logiciel, les réglages visibles et le contexte de démonstration. Un avant/après doit utiliser le même dossier, le même état Git, les mêmes dimensions et la même version du logiciel ; seuls les réglages comparés changent.

Exemple d'insertion, uniquement après création et revue du fichier :

```markdown
![Ghostty avec le prompt Starship dans un dépôt de démonstration](images/ghostty-shell.png)

Ghostty + Zsh + Starship. Mocha pour la fenêtre, Macchiato pour le prompt ; données de démonstration.
```
