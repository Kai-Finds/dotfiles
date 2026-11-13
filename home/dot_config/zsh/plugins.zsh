#==============================================================================
# PLUGINS CONFIGURATION
# Fichier: ~/.config/zsh/plugins.zsh
#==============================================================================

# Chargement ultra-différé de Starship pour accélérer le démarrage
function _load_starship() {
  # Initialiser Starship seulement une fois
  if ! type starship_loaded > /dev/null; then
    # Indiquer que starship est chargé
    function starship_loaded() { return 0 }

    if [ -f "$HOME/.local/share/zinit/plugins/starship---starship/starship" ]; then
      export STARSHIP_CONFIG=~/.config/starship.toml
      () {
        local starship_precmd_fn
        starship_precmd_fn="starship_precmd"
        if ! typeset -f "$starship_precmd_fn" >/dev/null 2>&1; then
          starship_precmd_fn="prompt_starship_precmd"
        fi
        precmd_functions=("${precmd_functions[@]:#"$starship_precmd_fn"}")
      }
      command -v starship >/dev/null && eval "$(starship init zsh)"
    else
      # Fallback si Starship n'est pas installé via zinit
      command -v starship >/dev/null && eval "$(starship init zsh)"
    fi
  fi
}

# Fonction qui est appelée avant chaque prompt
function _delayed_starship_precmd() {
  # Charger Starship seulement lors du premier prompt
  _load_starship

  # Remplacer cette fonction par celle de Starship
  if typeset -f starship_precmd >/dev/null; then
    precmd_functions=(${precmd_functions:#_delayed_starship_precmd})
    precmd_functions+=(starship_precmd)
    starship_precmd
  fi
}

# Ajouter notre fonction de préchargement aux fonctions précmd
precmd_functions+=(_delayed_starship_precmd)

# Chargement optimisé des plugins
# Autosuggestions (optimisé pour macOS)
if [ -f ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
    # Optimisation de la performance des suggestions
    ZSH_AUTOSUGGEST_USE_ASYNC=1
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # Rebind manuel pour éviter la surcharge
fi

# Optimisations pour zsh-syntax-highlighting
if [ -f ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    typeset -ga ZSH_HIGHLIGHT_HIGHLIGHTERS
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)  # Réduire au highlighter principal pour accélérer
    source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Recherche dans l'historique - charger uniquement si le fichier existe
if [ -f ~/.config/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source ~/.config/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# Plugin You Should Use - charger uniquement si le fichier existe
if [ -f ~/.config/zsh-you-should-use/you-should-use.plugin.zsh ]; then
    source ~/.config/zsh-you-should-use/you-should-use.plugin.zsh
fi

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# SDKMAN (lazy loaded)
_sdkman_init() {
  if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    unfunction _sdkman_init
  fi
}
alias sdk='_sdkman_init && sdk'

# Kiro terminal integration
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
