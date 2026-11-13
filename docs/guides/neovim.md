# Neovim + LazyVim : notre espace d'édition

[← Guides](../README.md) · [Neovim](https://neovim.io/) · [LazyVim](https://www.lazyvim.org/) · [Nos fichiers](../../home/dot_config/nvim)

## Le socle d'origine

Neovim est l'éditeur. LazyVim est une configuration de Neovim qui assemble déjà des plugins et des conventions pour l'édition, la recherche et les outils de développement. lazy.nvim gère les plugins.

La complétion, l'intégration LSP, les diagnostics et les raccourcis habituels de LazyVim ne sont pas des fonctionnalités créées par ce dépôt. Nos fichiers ajoutent des préférences à cette base et activent des extras.

## Nos choix au-dessus de LazyVim

| Choix | Résultat | Fichier |
| --- | --- | --- |
| Catppuccin Mocha transparent | Fond de l'éditeur et flottants transparents | [ui.lua](../../home/dot_config/nvim/lua/plugins/ui.lua) |
| Lualine et colonne de statut désactivées | Interface moins chargée | [ui.lua](../../home/dot_config/nvim/lua/plugins/ui.lua), [options.lua](../../home/dot_config/nvim/lua/config/options.lua) |
| Oil | Explorer et éditer le répertoire dans un buffer, fichiers cachés visibles | [editor.lua](../../home/dot_config/nvim/lua/plugins/editor.lua) |
| Sidebar Snacks désactivée | Navigation centrée sur Oil | [snacks.lua](../../home/dot_config/nvim/lua/plugins/snacks.lua) |
| Zen ponctuel | Alléger l'affichage à la demande | [snacks.lua](../../home/dot_config/nvim/lua/plugins/snacks.lua) |
| k9s en terminal flottant + flatten.nvim | Renvoyer les éditions imbriquées vers l'éditeur hôte | [devops.lua](../../home/dot_config/nvim/lua/plugins/devops.lua) |
| Kulala, schema-companion et actionlint | Requêtes HTTP, schémas YAML/Kubernetes et lint GitHub Actions | [devops.lua](../../home/dot_config/nvim/lua/plugins/devops.lua) |

## Gestes utiles

Dans les [conventions LazyVim](https://www.lazyvim.org/keymaps), `<leader>` est par défaut **Espace**. Les raccourcis ci-dessous s'utilisent en mode normal.

| Touches | Origine | Action |
| --- | --- | --- |
| `Espace` puis attendre | LazyVim / which-key | Afficher les suites de touches possibles |
| `-` | Notre déclaration Oil | Ouvrir le répertoire parent |
| `Espace z` | Notre déclaration Snacks | Basculer le mode Zen |
| `Espace Z` | Notre déclaration Snacks | Basculer le zoom Zen |
| `Espace k` | Notre intégration | Ouvrir k9s dans un terminal flottant |
| `Espace R s` | Notre déclaration Kulala | Exécuter une requête dans un fichier HTTP |

Dans Oil, les changements de noms ou suppressions peuvent être appliqués au système de fichiers à l'enregistrement : explorer avec `-` est un bon premier essai, modifier sa liste de fichiers demande de comprendre le fonctionnement du plugin.

Les raccourcis de sidebar `Espace e`, `Espace E`, `Espace f e` et `Espace f E` sont désactivés ici ; un tutoriel LazyVim standard peut donc montrer une navigation différente.

## L'intégration k9s, concrètement

`Espace k` lance k9s avec un `KUBE_EDITOR` destiné à l'instance Neovim courante. Le plugin flatten.nvim reçoit les ouvertures d'éditeurs imbriqués. La configuration masque le flottant k9s pendant une édition bloquante, puis le réaffiche à la fin.

C'est le comportement visé par la configuration. Il exige k9s, les plugins installés et un contexte Kubernetes valide ; le test isolé du dépôt ne valide pas ce parcours.

## Langages et installation

Le [fichier d'extras](../../home/dot_config/nvim/lazyvim.json) active notamment Python, Go, Rust, TypeScript, YAML, Helm, Terraform, Docker et Ansible, ainsi que des outils de test, debug et l'extra Claude Code. Activer un extra ne fournit ni compte, ni clé, ni outil externe associé.

Au premier lancement, lazy.nvim et les plugins doivent être téléchargés. Le verrouillage est conservé dans `lazy-lock.json`. Les vérifications automatiques de mises à jour sont désactivées ; `:Lazy check` permet une vérification manuelle. Consulter les [prérequis officiels LazyVim](https://www.lazyvim.org/) pour les outils de compilation et les dépendances de la version utilisée.

Pour commencer sans cluster : ouvrir un fichier de ce dépôt, utiliser `-`, puis `Espace z`. Lire les résultats de `:checkhealth` avant de considérer l'environnement complet comme opérationnel.
