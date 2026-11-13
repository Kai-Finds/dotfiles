#==============================================================================
# EXPORTS & ENVIRONMENT VARIABLES CONFIGURATION
# Fichier: ~/.config/zsh/exports.zsh
#==============================================================================

# Configuration du terminal et caractères de mot
WORDCHARS=${WORDCHARS//\/}
PROMPT_EOL_MARK=""

# Configuration de l'historique
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Support des couleurs pour ls, less et man (adapté pour macOS)
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export LS_COLORS="$LS_COLORS:ow=30;44:"

# Configuration de LESS
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Configuration NVM
export NVM_DIR="$HOME/.nvm"

# Performance améliorée du terminal
export TERM_PROFILE="Pro"
export PROMPT_COMMAND_TIMEOUT=2
export TERM=xterm

# Optimisations DNS
export HOSTALIASES=~/.hosts

# Configuration Starship
export STARSHIP_CONFIG=~/.config/starship.toml

# Configuration du format `time`
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Configuration du titre du terminal
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
    TERM_TITLE=$'\e]0;${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
*)
    ;;
esac

# OpenCode
export PATH=$HOME/.opencode/bin:$PATH

# OpenClaw
export PATH="$HOME/.openclaw/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"

# Java
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"

# Détection du système
_distro="macos"
