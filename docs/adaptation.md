# Adaptations et limites

## Ce qui diffère des originaux

- Valeurs sensibles, hôtes SSH et identité Git retirés. Identité et secrets restent dans les fichiers `.local` ignorés.
- Chemins du compte d'origine remplacés par `$HOME` dans le shell et `${HOME}` dans npm ; dossier de démarrage Ghostty et répertoire de dumps k9s laissés aux valeurs par défaut.
- Ancien chemin Node lié à une version et wrapper mail personnel retirés.
- Initialisation Cargo, wake et Starship conditionnelle ; styles Zsh initialisés même sans plugin. Raccourcis de recherche d'historique conditionnels.
- Wrapper Git qui réécrivait la configuration globale retiré. Les préférences Git de performance et les assistants d'authentification de la machine ne sont pas copiés.
- tmux utilise `pbcopy` sur macOS, une horloge native et un chargement conditionnel de TPM. L'ancien script de statut Git n'est pas distribué.
- bat conserve son thème intégré par défaut : le thème Catppuccin personnalisé n'est pas installé par ce dépôt.
- `.yarnrc` ne contenait que des métadonnées générées : exclu.

## Dépendances optionnelles

Zsh cherche les plugins déjà installés dans `~/.config/zsh-autosuggestions`, `~/.config/zsh-syntax-highlighting`, `~/.config/zsh-history-substring-search` et `~/.config/zsh-you-should-use`. Ils ne sont pas vendus dans ce dépôt ; sans eux, le shell conserve ses fonctionnalités de base. NVM, SDKMAN, Bun, Rust, Java, OrbStack et wake restent optionnels ; les alias nécessitent les outils qu'ils invoquent.

Neovim télécharge lazy.nvim et les plugins à son premier lancement : accès réseau nécessaire. Le fichier de verrouillage LazyVim est conservé. Neovim embarque sa licence d'origine dans son dossier. Aucun test ici ne garantit que tous les plugins, LSP et extras fonctionnent sur une machine vierge.

TPM doit être installé séparément dans `~/.tmux/plugins/tpm` pour activer les plugins tmux ; puis utiliser son raccourci d'installation `préfixe + I`.

## k9s

Emplacement macOS conservé : `~/Library/Application Support/k9s`. Sur Linux, déplacer ces fichiers dans le répertoire indiqué par `k9s info` ; Linux n'a pas été validé.

Les alias/vues Argo CD, cert-manager, Kyverno et Prometheus nécessitent les CRD correspondantes. Les plugins appellent selon le raccourci : stern, trivy, grype, popeye, pluto, jq, yq et kubectl-who-can. Ils ne sont pas installés automatiquement.

`readOnly: false` est conservé. **Shift-D et Shift-Z créent des ressources de debug dans le cluster**, dont un pod privilégié pour le debug de nœud. Ils ne sont exécutés que sur action utilisateur. Le plugin de décodage des Secrets affiche des données sensibles : ne pas partager de capture de son résultat. Ces plugins ne sont pas lancés par la validation.

Les accès Kubernetes, contextes et données `clusters/` ne sont jamais distribués.

## Confiance dans les projets ouverts

Le module Python Zsh active automatiquement un environnement virtuel trouvé dans le dossier courant ou ses parents ; cela source son script `bin/activate`. Le conserver uniquement si les projets parcourus sont de confiance, sinon retirer `python-venv.zsh` de la liste des modules dans `.zshrc`.

## Revenir en arrière

Restaurer les fichiers depuis sa propre sauvegarde, puis ouvrir un nouveau shell. Ce dépôt ne génère pas automatiquement de sauvegarde ni de script de restauration. Ne jamais appliquer l'ensemble avant d'avoir lu le diff.

## Documentation à côté des configurations

Chaque dossier sous `home/` possède son README. `home/.chezmoiignore` exclut les README de toutes les destinations : les explications restent dans le dépôt, les réglages seuls sont installés.
