# Les réglages installés dans le dossier personnel

[← Accueil](../README.md) · [Projet d’origine : chezmoi](https://www.chezmoi.io/) · [Guide détaillé](../docs/installation.md)

| Fichier source | Destination | Rôle |
| --- | --- | --- |
| `dot_zshrc` | `~/.zshrc` | Options Zsh, modules et chargement de `.zshrc.local` |
| `dot_zshenv` | `~/.zshenv` | Éditeur par défaut et initialisation Cargo si présent |
| `dot_zprofile` | `~/.zprofile` | Environnement de connexion macOS et chemins |
| `dot_profile` / `dot_bash_profile` | `~/.profile` / `~/.bash_profile` | Réglages des autres chemins de démarrage shell |
| `dot_gitconfig` | `~/.gitconfig` | Exclusions et inclusion de l'identité locale |
| `dot_npmrc` | `~/.npmrc` | Préfixe npm sous le dossier personnel |
| `dot_tmux.conf` | `~/.tmux.conf` | Préfixe Ctrl-A, panneaux et affichage tmux |

Zsh, Git, npm et tmux restent les logiciels d'origine. Nos fichiers règlent leur comportement sans fournir de compte, de clé ou d'identité Git.

Pour tmux : Ctrl-A puis `-` divise en panneaux superposés, Ctrl-A puis `m` zoome, Ctrl-A puis `r` recharge la configuration. Les plugins TPM nécessitent une installation séparée.

Les fichiers `.local` sont privés et ne font pas partie du dépôt. Les réglages des applications sont dans `dot_config/` et les réglages k9s macOS dans `Library/`.

## Appliquer ces réglages

Lire le [guide d’installation](../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
