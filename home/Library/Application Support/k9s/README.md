# k9s : vues, alias et plugins

[← Accueil](../../../../README.md) · [Projet d’origine : k9s](https://k9scli.io/) · [Guide détaillé](../../../../docs/guides/k9s.md)

k9s fournit une interface terminal pour les ressources Kubernetes. Notre configuration règle son apparence et ajoute des conventions de navigation ; elle ne fournit ni cluster ni droit d'accès.

| Fichier | Contenu |
| --- | --- |
| `config.yaml` | Rafraîchissement 2 s, logs, seuils et thème TokyoNight |
| `aliases.yaml` | Noms courts, par exemple `:po`, `:dp`, `:no` et `:pvc` |
| `views.yaml` | Colonnes workloads, images, ressources et opérateurs |
| `jumps.yaml` | Navigation vers des ressources associées |
| `plugins.yaml` | Raccourcis vers des utilitaires externes |
| `skins/` | Palette TokyoNight |

Exemples de plugins : Maj-L appelle stern, Maj-T Trivy, Maj-G Grype, Maj-I kubectl/yq pour Argo CD. Les exécutables doivent être installés et les ressources correspondantes présentes. Le guide complet donne la table de toutes les touches et dépendances.

**Maj-D et Maj-Z modifient le cluster** en lançant du debug ; Maj-Z crée un pod privilégié. Maj-B affiche les valeurs décodées d'un Secret. `readOnly: false` est conservé : commencer sur un contexte de test autorisé et lire `plugins.yaml` avant utilisation.

Destination : `~/Library/Application Support/k9s`. Vérifier `k9s info` et son contexte avant de démarrer. Les données `clusters/`, logs, sauvegardes et kubeconfig restent exclus.

## Appliquer ces réglages

Lire le [guide d’installation](../../../../docs/installation.md) et le diff chezmoi avant application. Les fichiers README restent dans le dépôt : ils sont exclus de l’installation.
