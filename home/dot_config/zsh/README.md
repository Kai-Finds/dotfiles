# Zsh : les modules du shell

[← Accueil](../../../README.md) · [Projet d’origine : Zsh](https://www.zsh.org/) · [Guide détaillé](../../../docs/guides/shell.md)

Zsh interprète les commandes et fournit l'édition de ligne. Nous séparons ses réglages en huit modules chargés par le `.zshrc` partagé.

| Fichier | Contenu |
| --- | --- |
| `exports.zsh` | Variables et chemins |
| `keybindings.zsh` | Édition de ligne et déplacements |
| `completion.zsh` | Présentation et cache de complétion |
| `plugins.zsh` | Starship et plugins optionnels déjà installés |
| `appearance.zsh` | Couleurs et titre |
| `aliases.zsh` | Alias Git, Kubernetes et macOS |
| `functions.zsh` | Petites fonctions de navigation et d'outillage |
| `python-venv.zsh` | Activation d'un environnement virtuel trouvé dans le projet |

Essais utiles : `gst` affiche l'état Git ; `mkcd demo` crée un dossier et y entre ; Ctrl-R recherche dans l'historique. `kgp` interroge Kubernetes dans le contexte actif, uniquement si kubectl et les accès sont disponibles.

Installer les exécutables avant d'utiliser leurs alias. Les plugins de suggestions et coloration ne sont pas inclus. Les raccourcis sont chargés avant les plugins dans ce snapshot : les liaisons conditionnelles de recherche par sous-chaîne ne sont pas garanties dans un nouveau shell.

Le module Python source un script du projet : à réserver aux dossiers de confiance. Certains alias de suppression ou fonctions macOS ont de vrais effets ; lire leur définition. Les réglages personnels se placent dans `~/.zshrc.local`.

## Appliquer ces réglages

Lire le [guide d’installation](../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
