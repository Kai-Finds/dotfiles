# btop : surveiller les ressources

[← Accueil](../../../README.md) · [Projet d’origine : btop](https://github.com/aristocratos/btop) · [Guide détaillé](../../../docs/guides/autres-outils.md)

btop est un moniteur de ressources en terminal. Notre fichier `btop.conf` sélectionne le thème TTY, un fond transparent, les panneaux CPU/mémoire/réseau/processus, l'arbre des processus et une mise à jour toutes les deux secondes.

Destination : `~/.config/btop/btop.conf`. Installer btop puis lancer `btop`. Les données proviennent de la machine où il s'exécute ; le dépôt ne fournit aucun historique de mesures.

`save_config_on_exit = true` permet à btop d'enregistrer ses changements de réglages en quittant. Une modification locale de la configuration n'est pas automatiquement synchronisée vers ce dépôt.

## Appliquer ces réglages

Lire le [guide d’installation](../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
