# k9s : le thème TokyoNight

[← Accueil](../../../../../README.md) · [Projet d’origine : k9s et les thèmes Tokyo Night](https://k9scli.io/topics/skins/) · [Guide détaillé](../../../../../docs/guides/k9s.md)

k9s fournit un mécanisme de skins. Notre `TokyoNight.yaml` définit les couleurs des tableaux, invites, logs, dialogues et bordures ; son fond reprend celui du terminal via la valeur `default`.

Le fichier parent `config.yaml` sélectionne ce thème avec `ui.skin: TokyoNight`. Installer le fichier sans sélectionner son nom dans la configuration ne suffit pas à activer ce choix.

Destination : `~/Library/Application Support/k9s/skins/TokyoNight.yaml`. Ce thème est indépendant de Catppuccin Mocha dans Ghostty et Macchiato dans Starship. Il ne change pas les colonnes, les droits Kubernetes ou les commandes disponibles.

## Appliquer ces réglages

Lire le [guide d’installation](../../../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
