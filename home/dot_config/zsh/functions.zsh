#==============================================================================
# FUNCTIONS CONFIGURATION
# Fichier: ~/.config/zsh/functions.zsh
#==============================================================================

# Remplacer la commande cat par bat pour une meilleure coloration syntaxique
function b() {
  bat --style=plain --paging=never "$@"
  [[ $(tail -c1 "$@") != "" && $(tail -c1 "$@") != $'\n' ]] && echo
}

# Ouvrir rapidement des applications macOS
function o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

# Créer un répertoire et y entrer
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Fonction pour changer de branche et récupérer les dernières modifications
function gpull() {
  git checkout "$1" && git pull
}

# Fonction pour créer une nouvelle branche et y accéder
function gnew() {
  git checkout -b "$1"
}

# Fonction pour cloner un dépôt et y accéder
function gclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# Fonction pour ajouter, valider et pousser les modifications
function gacp() {
  git add . && git commit -m "$1" && git push
}

# Fonction de recherche avancée avec ripgrep et fzf
function rgfz() {
  local term
  read -p "Enter search term: " term
  rg --no-heading --line-number --column --color=always --glob "!.git/" --glob "!exclude_dir/*" "$term" | \
  fzf --layout=reverse --height=95% --border=rounded --color=dark --preview='bat --style=numbers --color=always --highlight-line {2} {1}' --preview-window=right:70%:wrap --delimiter=: --ansi | \
  awk -F ':' '{print $1}' | xargs -ro nvim
}

# Fonction pour rechercher et tuer un processus
function pskill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  if [ "x$pid" != "x" ]; then
    kill -${1:-9} $pid
  fi
}

# Fonction pour sauvegarder les paramètres actuels du Finder
function savefinderprefs() {
  echo "💾 Sauvegarde des paramètres actuels du Finder..."
  defaults export com.apple.finder > ~/.finder_preferences_backup
  echo "✅ Paramètres sauvegardés dans ~/.finder_preferences_backup"
}

# Fonction pour restaurer les paramètres par défaut du Finder
function resetfinderprefs() {
  echo "🔄 Réinitialisation des paramètres du Finder..."
  defaults delete com.apple.finder
  killall Finder
  echo "✅ Paramètres du Finder réinitialisés"
}

# Fonction pour restaurer les paramètres sauvegardés du Finder
function restorefinderprefs() {
  if [ -f ~/.finder_preferences_backup ]; then
    echo "🔄 Restauration des paramètres sauvegardés du Finder..."
    defaults import com.apple.finder ~/.finder_preferences_backup
    killall Finder
    echo "✅ Paramètres du Finder restaurés"
  else
    echo "❌ Aucun fichier de sauvegarde trouvé"
  fi
}

# Fonction pour optimiser le Finder tout en préservant les paramètres visuels
function optimizefinder() {
  echo "⚡ Optimisation du Finder..."

  # Sauvegarder les paramètres actuels
  savefinderprefs

  # Optimisations qui n'affectent pas l'apparence
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
  defaults write com.apple.finder FXRemoveOldTrashItems -bool true

  # Redémarrer le Finder
  killall Finder
  echo "✅ Optimisations appliquées"
}

# Gestion avancée des captures d'écran
function screenshot-change-location() {
  if [ -z "$1" ]; then
    echo "Usage: screenshot-change-location /path/to/new/location"
    return 1
  fi
  mkdir -p "$1"
  defaults write com.apple.screencapture location "$1" && killall SystemUIServer
  echo "✅ Emplacement des captures d'écran modifié: $1"
}

# Chargement différé de zoxide pour une navigation rapide
function cd() {
  unfunction cd 2>/dev/null
  if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh --cmd cd)"
    cd "$@"
  else
    builtin cd "$@"
  fi
}

# Chargement différé de NVM
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}
