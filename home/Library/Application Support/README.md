# Application Support : la configuration k9s

[← Accueil](../../../README.md) · [Projet d’origine : k9s](https://k9scli.io/topics/config/) · [Guide détaillé](../../../docs/guides/k9s.md)

Sur macOS, k9s peut lire sa configuration dans `~/Library/Application Support/k9s`. Ce dossier garde cet emplacement plutôt que de forcer un chemin Linux sous `.config`.

`k9s info` permet de vérifier les chemins utilisés sur sa propre machine. Le sous-dossier `k9s/` contient son README, les fichiers distribués et le thème. Aucun autre dossier d'application de la machine n'est copié ici.

## Appliquer ces réglages

Lire le [guide d’installation](../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
