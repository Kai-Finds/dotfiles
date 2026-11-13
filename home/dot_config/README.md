# Les configurations des applications

[← Accueil](../../README.md) · [Projet d’origine : chezmoi](https://www.chezmoi.io/) · [Guide détaillé](../../docs/README.md)

Chaque sous-dossier correspond à une application. `dot_config` devient `~/.config` lors de l'application chezmoi.

| Élément | Usage |
| --- | --- |
| `starship.toml` | Prompt Catppuccin Macchiato, chemin court, branche et état Git |
| `zsh/` | Modules du shell et alias |
| `ghostty/` | Apparence et raccourcis de la fenêtre du terminal |
| `nvim/` | Configuration Neovim basée sur LazyVim |
| `bat/`, `btop/`, `git/`, `zed/` | Préférences indépendantes, expliquées dans chaque README |

Starship est le moteur qui construit l'invite ; notre fichier choisit sa palette et ses modules. Pour l'utiliser, installer Starship et l'initialiser dans son shell. Notre Zsh le fait dans `plugins.zsh`.

Le nom d'hôte, l'horloge, la mémoire et le contexte Kubernetes sont masqués dans le prompt. Les indicateurs de langages dépendent du projet et des exécutables présents. Lire `starship.toml` pour adapter ces choix.

Pour essayer uniquement Starship depuis la racine du clone : `chezmoi --source "$PWD" diff ~/.config/starship.toml`, puis appliquer le fichier après sauvegarde. Les dossiers n'ont pas besoin d'être adoptés ensemble.

## Appliquer ces réglages

Lire le [guide d’installation](../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
