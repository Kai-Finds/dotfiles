# Zsh et Starship : les commandes et leur contexte

[← Guides](../README.md) · [Zsh](https://www.zsh.org/) · [Starship](https://starship.rs/)

## Deux projets, deux rôles

**Zsh** est le shell : il lit les commandes, développe les alias, lance les programmes et gère l'édition de la ligne. **Starship** dessine l'invite avant la commande, avec des informations sur le dossier, Git ou les langages détectés. L'affichage de ces informations vient de Starship ; nous en choisissons la présentation.

## Notre Zsh modulaire

[`.zshrc`](../../home/dot_zshrc) charge les fichiers du [dossier Zsh](../../home/dot_config/zsh). On peut ainsi modifier les alias sans parcourir toute la configuration.

| Module | Contenu |
| --- | --- |
| `exports.zsh` | Historique, variables et chemins d'outils |
| `keybindings.zsh` | Raccourcis d'édition et de navigation |
| `completion.zsh` | Initialisation et présentation de la complétion |
| `plugins.zsh` | Starship et chargement des plugins déjà présents |
| `appearance.zsh` | Styles de coloration et titre du terminal |
| `aliases.zsh` | Raccourcis Git, Kubernetes et outils macOS |
| `functions.zsh` | Navigation et petites commandes composées |
| `python-venv.zsh` | Activation d'un environnement virtuel selon le répertoire |

Quelques gestes configurés :

| Commande / touche | Ce qu'elle fait |
| --- | --- |
| `gst` | `git status` |
| `gl` | Historique Git en graphe |
| `kgp` | `kubectl get pod` dans le contexte actif |
| `kctx` | Afficher le contexte Kubernetes actif |
| `mkcd demo` | Créer `demo` puis y entrer |
| `n` | Ouvrir le dossier courant dans Neovim |
| Ctrl-R | Rechercher dans l'historique |
| Ctrl-A / Ctrl-E | Début / fin de ligne |
| Option-← / Option-→ | Déplacement par mot selon les séquences émises par le terminal |

Les alias restent des commandes ordinaires : `kgp` exige kubectl et un accès Kubernetes ; `ls` est remplacé par eza. Les fonctions qui utilisent Git, fzf, bat ou Neovim exigent ces programmes.

## Notre prompt Starship

La [configuration Starship](../../home/dot_config/starship.toml) choisit une palette Catppuccin Macchiato, un chemin raccourci, une branche bleue et un état Git couleur pêche. La flèche de saisie est verte après un succès et rouge après une erreur.

Les compteurs Git distinguent notamment les changements locaux, les fichiers non suivis et les commits en avance ou en retard. Les modules de langages sont activés selon les fichiers reconnus dans le dossier et les outils disponibles.

Le nom d'hôte, l'horloge, la mémoire et le module Kubernetes sont désactivés. Le module d'IP locale reste activé pour les sessions SSH : le vérifier avant de publier une capture distante. Les glyphes demandent une police adaptée.

**Exemple de lecture, sans reproduire le rendu graphique :**

```text
mon-projet on main (état Git) via version-du-langage
❯ commande
```

Le contenu réel dépend du projet et de son état ; aucune liste de services n'est codée dans le prompt.

## Essayer et adapter

Depuis le clone, lire puis appliquer uniquement le fichier Starship selon le [guide d'installation](../installation.md). Dans un nouveau shell, entrer dans un dépôt Git et comparer l'invite avant et après un changement de dossier. `starship explain` aide à identifier les modules affichés.

Les réglages privés se placent dans `~/.zshrc.local`, chargé à la fin de notre `.zshrc`. Ce fichier n'est pas distribué.

## Limites à connaître

Les plugins de suggestions et de coloration ne sont pas inclus. Les liaisons de recherche par sous-chaîne sont conditionnelles ; ce snapshot charge les raccourcis avant les plugins, donc ne garantit pas ces liaisons dans un nouveau shell. Ctrl-R reste disponible.

L'activation Python source le script d'un environnement virtuel trouvé dans le projet : utiliser cette fonction uniquement dans des dossiers de confiance. Certains alias peuvent supprimer des ressources ou modifier macOS ; lire leur définition avant de les utiliser.
