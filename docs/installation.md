# Installation progressive

[← Accueil](../README.md)

Les commandes sont prévues pour macOS / Apple Silicon. Chaque bloc est à lancer depuis la racine du clone, sauf indication contraire. Installer un logiciel et appliquer sa configuration sont deux étapes distinctes.

## 1. Cloner et vérifier sans modifier son environnement

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

## 2. Installer les outils

Depuis ce dépôt, lire le `Brewfile`, puis installer les outils souhaités :

```sh
brew bundle --file=./Brewfile
```

Le Brewfile est une sélection utile, pas un export de tous mes logiciels. Les plugins et outils optionnels sont décrits dans [adaptation.md](adaptation.md).

## 3. Choisir les réglages à appliquer

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

## 4. Commencer avec un seul outil

Si Starship est déjà installé et initialisé dans ton shell, tu peux essayer uniquement son thème :

```sh
chezmoi --source "$PWD" diff ~/.config/starship.toml
chezmoi --source "$PWD" apply ~/.config/starship.toml
```

Sans initialisation existante, ajouter `eval "$(starship init zsh)"` à son propre `.zshrc`, puis ouvrir un nouveau shell. Notre `.zshrc` charge déjà Starship via son module de plugins : inutile de l'initialiser une seconde fois.

Pour les autres outils, regarder le diff de leur dossier, puis appliquer seulement ce dossier après sauvegarde :

```sh
chezmoi --source "$PWD" diff ~/.config/ghostty
chezmoi --source "$PWD" apply ~/.config/ghostty
# Ou, pour k9s sur macOS :
chezmoi --source "$PWD" diff "$HOME/Library/Application Support/k9s"
```

Zsh est modulaire : copier seulement `.zshrc` ne copie pas les modules. Pour adopter notre shell, lire et appliquer ensemble `.zshrc`, `.zshenv`, `.zprofile` et `.config/zsh/`. Pour garder son shell actuel, reprendre seulement les alias ou fonctions qui intéressent.

## 5. Vérifier dans l'application

| Outil | Vérification manuelle |
| --- | --- |
| Ghostty | Ouvrir une nouvelle fenêtre, vérifier police, thème et splits |
| Zsh / Starship | Ouvrir un nouveau shell, se déplacer dans un dépôt Git et lancer `gst` |
| Neovim | Lancer `nvim`, laisser les plugins s'installer, puis utiliser `:checkhealth` |
| k9s | Vérifier `k9s info`, puis utiliser un contexte de test déjà autorisé |
| tmux | Ouvrir une nouvelle session `tmux`, puis tester le préfixe Ctrl-A |

Un démarrage sans erreur dans le test isolé ne garantit pas les plugins Neovim, les raccourcis graphiques, les CRD ou les accès Kubernetes. Voir [les limites et le retour arrière](adaptation.md).
