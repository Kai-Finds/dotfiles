# Git : les exclusions communes

[← Accueil](../../../README.md) · [Projet d’origine : Git](https://git-scm.com/docs/gitignore) · [Guide détaillé](../../../docs/guides/autres-outils.md)

Git fournit le suivi de versions et ses mécanismes d'exclusion. Notre fichier `ignore` ignore `**/.claude/settings.local.json` pour éviter d'ajouter ces préférences locales par défaut.

Destination : `~/.config/git/ignore`. Le fichier `home/dot_gitconfig` du dépôt référence ce chemin via `core.excludesfile` ; copier seulement le fichier d'exclusions ne configure pas cette référence.

Notre `.gitconfig` inclut aussi `~/.gitconfig.local`, où placer son nom, son adresse de commit et son propre assistant d'authentification. Un modèle est fourni dans `examples/` à la racine du dépôt. Aucun identifiant n'est distribué.

Cette exclusion ne couvre pas tous les secrets. Vérifier le diff et lancer le scan avant publication.

## Appliquer ces réglages

Lire le [guide d’installation](../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
