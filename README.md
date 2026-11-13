# SabaiDev · dotfiles

Mon environnement de développement macOS / Apple Silicon, préparé pour être partagé et adapté : **Zsh · Starship · k9s · Neovim**.

Copie publique expurgée des réglages personnels, pas une sauvegarde complète de la machine. Les originaux et la base chezmoi existante restent indépendants.

| Outil | Ce qui est partagé |
| --- | --- |
| Zsh | Modules, alias Git/Kubernetes, raccourcis, complétion, fonctions et activation Python |
| Starship | Prompt Catppuccin Macchiato, Git et indicateurs de langages |
| k9s | TokyoNight, vues DevOps, alias, jumps et plugins |
| Neovim | LazyVim, Catppuccin transparent, Oil, LSP et intégration k9s |
| Ghostty | Thème Mocha, police, transparence et raccourcis |
| tmux | Préfixe Ctrl-A, splits, navigation et déclaration des plugins TPM |
| Autres | Git sans identité, bat, btop, Zed et préfixe npm |

[Inventaire des fichiers détectés et distribués](docs/inventaire.md) · [Adaptations et précautions](docs/adaptation.md)

## Essayer sans modifier son environnement

Prérequis : macOS avec Homebrew, Git, Python 3.11+ et chezmoi (`brew install chezmoi`). Cloner le dépôt, puis lancer le contrôle :

```sh
git clone https://github.com/Kai-Finds/dotfiles.git
cd dotfiles
```

Depuis ce clone :

```sh
python3 tests/verify.py
```

Ce contrôle applique les fichiers dans un répertoire temporaire, vérifie le résultat et démarre Zsh avec ce HOME isolé. Il ne démarre pas Neovim et ne se connecte à aucun cluster.

## Installer les outils

Depuis ce dépôt, lire le `Brewfile`, puis installer les outils souhaités :

```sh
brew bundle --file=./Brewfile
```

Le Brewfile est une sélection utile, pas un export de tous mes logiciels. Les plugins et outils optionnels sont décrits dans [adaptation.md](docs/adaptation.md).

## Utiliser les réglages

Commencer par les lire. Sauvegarder ses fichiers existants avant toute application. Les commandes ci-dessous utilisent explicitement ce clone pour éviter de changer la source chezmoi déjà configurée :

```sh
chezmoi --source "$PWD" diff
# Après lecture du diff, appliquer seulement les fichiers souhaités :
chezmoi --source "$PWD" apply ~/.config/starship.toml
# Ou appliquer l'ensemble après sauvegarde :
chezmoi --source "$PWD" apply
```

Ajouter son identité et ses réglages privés :

```sh
cp examples/gitconfig.local.example ~/.gitconfig.local
cp examples/zshrc.local.example ~/.zshrc.local
```

Ne pas écraser ces fichiers s'ils existent déjà. Modifier ensuite les exemples copiés.

## Organisation et contributions

- `home/` : fichiers gérés par chezmoi (`dot_` devient un point).
- `docs/` : inventaire, limites et différences avec la machine d'origine.
- `examples/` : modèles de réglages privés, jamais de vraies clés.
- `tests/` : contrôle d'installation isolée.
- `Brewfile` : dépendances macOS sélectionnées.

Pour proposer une modification : adapter uniquement les fichiers concernés, lancer `python3 tests/verify.py` puis `gitleaks dir . --redact`. Ajouter les captures d'écran uniquement après vérification de leur contenu. Éviter `chezmoi add ~` et les copies globales de dossiers d'applications.

Références : [chezmoi, options source et destination](https://www.chezmoi.io/reference/command-line-flags/global/), [emplacements de configuration k9s](https://k9scli.io/topics/config/).

## Licence

Apache-2.0 ; les composants tiers conservent leurs licences respectives.
