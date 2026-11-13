# Les autres outils partagés

[← Guides](../README.md)

Ces réglages sont indépendants : il n'est pas nécessaire d'adopter tmux ou Zed pour utiliser notre prompt Starship.

## tmux : les sessions de terminal

[tmux](https://github.com/tmux/tmux/wiki) fournit des sessions, fenêtres et panneaux gérés à l'intérieur du terminal. Les splits Ghostty appartiennent à la fenêtre de l'application ; les panneaux tmux appartiennent à une session tmux.

[Notre fichier](../../home/dot_tmux.conf) place la barre en haut, active la souris et remplace le préfixe par **Ctrl-A**. Pour les commandes suivantes, appuyer sur Ctrl-A, relâcher, puis taper la seconde touche.

| Séquence | Action configurée |
| --- | --- |
| Ctrl-A puis `\|` | Diviser horizontalement en panneaux côte à côte |
| Ctrl-A puis `-` | Diviser en panneaux superposés |
| Ctrl-A puis `m` | Agrandir / rétablir le panneau actif |
| Ctrl-A puis `r` | Recharger `.tmux.conf` |
| Ctrl-A puis `h`, `j`, `k`, `l` | Redimensionner un panneau |
| Ctrl-A puis Ctrl-S | Synchroniser / désynchroniser la saisie des panneaux |

La synchronisation envoie les mêmes commandes à plusieurs panneaux : vérifier les sessions concernées avant de l'activer. En mode copie vi, `y` copie avec `pbcopy` sur macOS.

TPM et les plugins de navigation, thème et restauration sont déclarés, mais ne sont pas téléchargés par ce dépôt. Installer [TPM](https://github.com/tmux-plugins/tpm) séparément pour les utiliser. Sans TPM, la configuration de base reste chargeable ; aucune restauration de sessions n'est garantie par la seule présence des déclarations.

## bat, btop et Zed

| Logiciel d'origine | Notre réglage | Fichier |
| --- | --- | --- |
| [bat](https://github.com/sharkdp/bat) : lecture de fichiers avec coloration | Numéros de ligne et changements ; thème personnalisé laissé en commentaire | [config](../../home/dot_config/bat/config) |
| [btop](https://github.com/aristocratos/btop) : moniteur de ressources | Thème TTY, fond transparent, arbre de processus et rafraîchissement à 2 s | [btop.conf](../../home/dot_config/btop/btop.conf) |
| [Zed](https://zed.dev/) : éditeur graphique | Ayu Dark, interface 16 pt et texte 15 pt | [settings.json](../../home/dot_config/zed/settings.json) |

La palette de bat n'est pas automatiquement harmonisée avec Ghostty. Zed n'est pas installé par le Brewfile ; seul son fichier de préférences est partagé.

## Git et npm

[Notre `.gitconfig`](../../home/dot_gitconfig) définit un fichier global d'exclusions et inclut `~/.gitconfig.local`. Il ne configure ni identité de commit ni assistant d'authentification. Reprendre le [modèle d'identité](../../examples/gitconfig.local.example) et l'adapter à son compte.

[Le fichier d'exclusions](../../home/dot_config/git/ignore) ignore les réglages Claude locaux dans les dépôts. Ce choix ne dispense pas de vérifier les fichiers avant un commit.

[Notre `.npmrc`](../../home/dot_npmrc) déplace le préfixe des installations globales npm sous `~/.npm-global` ; le shell ajoute son dossier `bin` au PATH. Ce choix peut interagir avec les gestionnaires de versions Node : le conserver seulement s'il correspond à ta façon de gérer Node.
