#==============================================================================
# COMPLETION CONFIGURATION
# Fichier: ~/.config/zsh/completion.zsh
#==============================================================================

# Système de chargement différé pour compinit - grande optimisation de vitesse
autoload -Uz compinit

# Créer un dossier de cache pour la complétion
if [[ ! -d ~/.zsh/cache ]]; then
  mkdir -p ~/.zsh/cache
fi

# Charger compinit seulement une fois par jour pour optimiser le démarrage
if [[ -f ~/.zcompdump && $(find ~/.zcompdump -mtime +1) ]]; then
  compinit
else
  compinit -C
fi

# Configurer le cache de complétion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Optimiser le système de complétion ZSH
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Ajuster la complétion pour `cd` afin de ne pas compléter automatiquement les sous-répertoires
zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories

# Configurer la complétion pour utiliser les couleurs
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
