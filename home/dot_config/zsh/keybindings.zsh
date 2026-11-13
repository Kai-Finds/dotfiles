#==============================================================================
# KEYBINDINGS CONFIGURATION
# Fichier: ~/.config/zsh/keybindings.zsh
#==============================================================================

# Configuration des raccourcis clavier
bindkey -e                                # Mode d'édition Emacs (standard pour macOS)

# Navigation et édition de ligne
bindkey '^A' beginning-of-line            # Ctrl + A : début de ligne
bindkey '^E' end-of-line                  # Ctrl + E : fin de ligne
bindkey '^K' kill-line                    # Ctrl + K : supprimer jusqu'à la fin de la ligne
bindkey '^U' backward-kill-line           # Ctrl + U : supprimer jusqu'au début de la ligne
bindkey '^W' backward-kill-word           # Ctrl + W : supprimer le mot précédent
bindkey '^Y' yank                         # Ctrl + Y : coller le texte supprimé
bindkey '^_' undo                         # Ctrl + _ : annuler

# Support des touches de fonction macOS
bindkey "^[[H" beginning-of-line          # Home : début de ligne
bindkey "^[[F" end-of-line                # End : fin de ligne
bindkey "^[[3~" delete-char               # Suppr : supprimer le caractère

# Option + flèches pour naviguer par mot (formats standards macOS)
bindkey "^[b" backward-word               # Option + ← : mot précédent (Terminal.app)
bindkey "^[f" forward-word                # Option + → : mot suivant (Terminal.app)
bindkey "^[[1;3D" backward-word           # Option + ← : mot précédent (iTerm2/GhostTTY)
bindkey "^[[1;3C" forward-word            # Option + → : mot suivant (iTerm2/GhostTTY)
# Support pour GhostTTY - séquences alternatives pour Option+flèches
bindkey "^[^[[D" backward-word            # Option + ← : mot précédent (GhostTTY)
bindkey "^[^[[C" forward-word             # Option + → : mot suivant (GhostTTY)

# Raccourcis Command/Cmd (spécifiques à iTerm2/GhostTTY correctement configuré)
bindkey "^[[1;9D" beginning-of-line       # Cmd + ← : début de ligne
bindkey "^[[1;9C" end-of-line             # Cmd + → : fin de ligne
# Séquences alternatives pour GhostTTY Cmd+flèches
bindkey "^[^[^[[D" beginning-of-line      # Cmd + ← : début de ligne (GhostTTY)
bindkey "^[^[^[[C" end-of-line            # Cmd + → : fin de ligne (GhostTTY)

# Raccourcis pour supprimer des mots avec Option+Delete (standard macOS)
bindkey "^[^?" backward-kill-word         # Option + Backspace : supprimer mot précédent
bindkey "^[d" kill-word                   # Option + d : supprimer mot suivant
# Séquence alternative pour GhostTTY
bindkey "^[^H" backward-kill-word         # Option + Backspace : alternative pour GhostTTY

# Support pour naviguer dans l'historique avec recherche
bindkey '^P' history-beginning-search-backward  # Ctrl + P : recherche dans l'historique en arrière
bindkey '^N' history-beginning-search-forward   # Ctrl + N : recherche dans l'historique en avant
bindkey '^R' history-incremental-search-backward # Ctrl + R : recherche incrémentale en arrière
bindkey ' ' magic-space                          # Espace : expansion de l'historique

# Configuration pour zsh-history-substring-search
if (( $+functions[history-substring-search-up] )); then
bindkey '^[[A' history-substring-search-up      # Flèche haut
bindkey '^[[B' history-substring-search-down    # Flèche bas
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
fi

# Support pour les combinaisons de touche alternatives sur macOS
bindkey "^[[1~" beginning-of-line          # Début alternatif
bindkey "^[[4~" end-of-line                # Fin alternatif

# Raccourcis supplémentaires utiles sur macOS
bindkey "^L" clear-screen                  # Ctrl + L : effacer l'écran
bindkey "^T" transpose-chars               # Ctrl + T : inverser les caractères
bindkey "^X^E" edit-command-line           # Ctrl+X puis Ctrl+E : éditer ligne dans $EDITOR

# Lier la touche TAB à la complétion
bindkey '^I' expand-or-complete
