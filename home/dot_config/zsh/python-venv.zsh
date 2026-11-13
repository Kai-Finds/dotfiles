#==============================================================================
# PYTHON VIRTUAL ENVIRONMENT MANAGEMENT
# Fichier: ~/.config/zsh/python-venv.zsh
#==============================================================================

# Variable pour garder une trace de l'environnement virtuel actif précédemment
typeset -g _LAST_VIRTUAL_ENV=""

# Fonction pour désactiver l'environnement virtuel actuel
deactivate_venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    # Message de débogage - à retirer une fois le problème résolu
    # echo "Désactivation de l'environnement virtuel : $(basename $VIRTUAL_ENV)"

    # Tentative de désactivation avec la méthode standard
    if typeset -f deactivate >/dev/null 2>&1; then
      deactivate 2>/dev/null || true
    else
      # Méthode de secours si la fonction deactivate n'est pas disponible
      # Sauvegarde du PATH original
      if [[ -n "$_OLD_VIRTUAL_PATH" ]]; then
        PATH="$_OLD_VIRTUAL_PATH"
        export PATH
        unset _OLD_VIRTUAL_PATH
      fi

      # Restauration du PYTHONHOME s'il était défini
      if [[ -n "$_OLD_VIRTUAL_PYTHONHOME" ]]; then
        PYTHONHOME="$_OLD_VIRTUAL_PYTHONHOME"
        export PYTHONHOME
        unset _OLD_VIRTUAL_PYTHONHOME
      fi

      # Nettoyage des variables d'environnement
      unset VIRTUAL_ENV
    fi

    # S'assurer que la variable VIRTUAL_ENV est bien nettoyée
    unset VIRTUAL_ENV
    _LAST_VIRTUAL_ENV=""

    # Mise à jour du prompt
    if typeset -f _update_vte_prompt >/dev/null 2>&1; then
      _update_vte_prompt
    fi
  fi
}

# Fonction pour activer un environnement virtuel
activate_venv() {
  local venv_path="$1"

  # Si on a déjà cet environnement actif, ne rien faire
  if [[ "$VIRTUAL_ENV" == "$venv_path" ]]; then
    return
  fi

  # Désactiver l'environnement virtuel actuel si nécessaire
  if [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate_venv
  fi

  # Activer le nouvel environnement virtuel avec gestion d'erreur
  if [[ -f "$venv_path/bin/activate" ]]; then
    source "$venv_path/bin/activate" || echo "❌ Échec d'activation de l'environnement virtuel $venv_path"
    _LAST_VIRTUAL_ENV="$venv_path"
  fi
}

# Fonction pour trouver et activer un environnement virtuel dans le répertoire courant ou ses parents
find_and_activate_venv() {
  # Ne pas exécuter dans le répertoire home pour éviter des recherches lentes
  if [[ "$PWD" == "$HOME" || "$PWD" == "/" ]]; then
    # Si on est dans HOME ou à la racine, désactiver tout environnement actif
    if [[ -n "$VIRTUAL_ENV" ]]; then
      deactivate_venv
    fi
    return
  fi

  local current_dir="$PWD"
  local venv_path=""
  local current_venv_dir=""

  # Si un environnement est déjà actif, déterminer son répertoire parent
  if [[ -n "$VIRTUAL_ENV" ]]; then
    # Extraire le répertoire parent de l'environnement virtuel actuel
    for venv_name in .venv venv .env env; do
      if [[ "$VIRTUAL_ENV" == *"/$venv_name" ]]; then
        current_venv_dir="${VIRTUAL_ENV%/$venv_name}"
        break
      fi
    done
  fi

  # Chercher un dossier .venv dans le répertoire courant et ses parents (limité à 5 niveaux pour la performance)
  local depth=0
  while [[ "$current_dir" != "/" && $depth -lt 5 ]]; do
    for venv_name in .venv venv .env env; do
      if [[ -d "$current_dir/$venv_name" && -f "$current_dir/$venv_name/bin/activate" ]]; then
        venv_path="$current_dir/$venv_name"
        break 2
      fi
    done
    current_dir=$(dirname "$current_dir")
    ((depth++))
  done

  # Décider quoi faire avec l'environnement virtuel
  if [[ -n "$venv_path" ]]; then
    # Un environnement virtuel a été trouvé

    # Si c'est un environnement différent de l'actuel, l'activer
    if [[ "$VIRTUAL_ENV" != "$venv_path" ]]; then
      activate_venv "$venv_path"
    fi
  else
    # Aucun environnement virtuel trouvé pour le répertoire actuel
    # Désactiver tout environnement actif
    if [[ -n "$VIRTUAL_ENV" ]]; then
      # Message optionnel pour déboguer
      # echo "Désactivation de l'environnement virtuel $VIRTUAL_ENV car nous avons quitté son répertoire"
      deactivate_venv
    fi
  fi
}

# Fonction appelée automatiquement après chaque changement de répertoire
autoload -U add-zsh-hook
add-zsh-hook chpwd find_and_activate_venv

# Exécuter au démarrage pour activer l'environnement virtuel si présent dans le répertoire initial
find_and_activate_venv
