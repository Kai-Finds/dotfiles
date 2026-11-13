# k9s : explorer Kubernetes depuis le terminal

[← Guides](../README.md) · [Projet d'origine](https://k9scli.io/) · [Nos fichiers](../../home/Library/Application%20Support/k9s)

## Le projet d'origine

k9s affiche et permet de gérer les ressources Kubernetes dans une interface terminal. Les vues de ressources, les logs, les filtres, les port-forwards et l'extensibilité par plugins sont fournis par k9s.

Notre dépôt choisit l'apparence, les colonnes et des raccourcis vers des commandes externes. Il ne fournit aucun cluster, kubeconfig, contexte ni droit d'accès.

## Nos réglages

| Fichier | Apport de notre configuration |
| --- | --- |
| `config.yaml` | Vue initiale pods, rafraîchissement 2 s, logs horodatés, seuils CPU/mémoire 70 % et 90 %, port-forward limité à 127.0.0.1 |
| `skins/TokyoNight.yaml` | Palette TokyoNight et fond utilisant celui du terminal |
| `views.yaml` | Colonnes choisies par ressource : images, consommation, état, nœud et informations DevOps |
| `aliases.yaml` | Noms courts pour workloads, stockage, RBAC et ressources d'opérateurs |
| `jumps.yaml` | Navigation de certaines ressources vers leurs ressources associées |
| `plugins.yaml` | Appels à stern, scanners, outils RBAC et commandes kubectl |

Les valeurs CPU/mémoire dépendent des données disponibles dans le cluster ; nos colonnes ne créent pas de métriques. Les vues Argo CD, cert-manager, Kyverno et Prometheus exigent leurs CRD.

## Naviguer avec nos alias

Dans la barre de commande k9s, essayer `:po` pour les pods, `:dp` pour les déploiements, `:no` pour les nœuds ou `:pvc` pour les volumes réclamés. Le mécanisme d'alias vient de k9s ; ces noms sont déclarés dans notre fichier.

Les jumps configurés relient notamment une application Argo CD aux pods de son namespace de destination et un certificat à son Secret associé. Ils dépendent de la structure des ressources et de leurs droits de lecture.

## Plugins : savoir ce que chaque touche lance

Ces raccourcis dépendent de la ressource sélectionnée. Ils appellent de vrais programmes et héritent des droits du contexte courant.

| Raccourci | Action configurée | Outil nécessaire / effet |
| --- | --- | --- |
| Maj-L | Logs multi-pods avec choix de période | stern |
| Maj-E | Description et événements récents | kubectl |
| Maj-T | Scanner les images des conteneurs | trivy ; filtre les sévérités et ignore les vulnérabilités sans correctif |
| Maj-G | Scanner les images des conteneurs | grype ; résultats limités aux vulnérabilités corrigibles |
| Maj-P | Audit de bonnes pratiques du namespace | popeye |
| Maj-V | Rechercher les API obsolètes | pluto |
| Maj-W | Lister les permissions d'un ServiceAccount | kubectl ; impersonation autorisée nécessaire |
| Maj-H | Demander qui peut effectuer une opération | kubectl-who-can |
| Maj-I | Lire l'état d'une application Argo CD | kubectl et yq |
| Maj-B | Afficher les valeurs d'un Secret décodées en base64 | kubectl et jq ; affiche des données sensibles |
| Maj-D | Ajouter un conteneur de debug netshoot au pod | kubectl ; **modifie le cluster** |
| Maj-Z | Créer un pod de debug privilégié sur un nœud | kubectl ; **modifie le cluster** |

Les plugins de scan utilisent les références d'images déclarées par le pod, sans résolution explicite vers le digest d'exécution. Ils ne prouvent donc pas à eux seuls l'état exact du binaire déployé. Les différences de filtres Trivy/Grype empêchent une comparaison directe de leurs comptes.

`readOnly: false` est conservé. Ne pas supposer que les plugins sont bloqués en passant simplement l'interface en lecture seule : leurs commandes et leurs droits doivent aussi être contrôlés. Aucun de ces plugins n'est exécuté par le test du dépôt.

## Premier lancement

Sur macOS, nos fichiers vont dans `~/Library/Application Support/k9s`. [La documentation k9s](https://k9scli.io/topics/config/) explique les emplacements ; `k9s info` indique ceux de ta machine.

Vérifier son contexte avec `kubectl config current-context` avant de lancer k9s. Pour une découverte, utiliser un cluster de test déjà autorisé et commencer par les vues et les alias. Les utilitaires des plugins sont optionnels et ne sont pas tous installés par notre Brewfile.

Ne jamais partager une capture contenant un Secret, des identifiants ou les noms et adresses d'une infrastructure privée. Voir le [guide de capture](../captures.md).
