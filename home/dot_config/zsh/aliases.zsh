#==============================================================================
# ALIAS CONFIGURATION
# Fichier: ~/.config/zsh/aliases.zsh
#==============================================================================

#----- Alias Système -----
alias ..="cd .."
alias lt="eza --tree --level=2 --long --icons --git -a"
alias ls="eza --long --icons --git"
alias ll="eza -a --long --icons --git"
alias tree="eza -T --no-quotes"
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias n="nvim ."
alias vim='nvim'
alias vi='vim'
alias fz='find . -path "./exclude_dir" -prune -o ! -path "*/.*" -type f -print | fzf --layout=reverse --height=95% --border=rounded --color=dark --preview="bat -p --color=always --line-range :500 {}" --preview-window=right:70%:wrap --ansi | xargs -ro nvim'
alias fd='fd --no-ignore'
alias torrent='transmission-cli'
alias browser-tool='npx @agentdeskai/browser-tools-server@1.2.0'

# Alias d'historique
alias history="history 0"
alias sysinfo='system_profiler SPHardwareDataType'
alias myip='curl ifconfig.me'
alias h='history | grep'
alias up='brew update && brew upgrade && brew cleanup && brew doctor'

#----- Alias Réseau -----
alias http-server='python3 -m http.server 8000'
alias nmap-vulns='sudo nmap -sC -sV --script nmap-vulners/ -v -A'
alias nmap-vulns-udp='sudo nmap -sC -sU --script nmap-vulners/ -v -A'
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias ip-public="curl ifconfig.me"
alias wifi-restart="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"

#----- Alias macOS Spécifiques -----
alias finder="open -a Finder ./"
alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"
alias disablespotlight="sudo mdutil -a -i off"
alias enablespotlight="sudo mdutil -a -i on"
alias app-store="open -a 'App Store'"
alias preview="open -a Preview"
alias xcode="open -a Xcode"
alias safari="open -a Safari"
alias chrome="open -a 'Google Chrome'"
alias firefox="open -a Firefox"

#----- Alias Kubernetes -----
alias k='kubectl'
# Commandes Get
alias kgc='kubectl get configmap'
alias kgcj='kubectl get cronjobs'
alias kgd='kubectl get deployment'
alias kging='kubectl get ingress'
alias kgj='kubectl get jobs'
alias kgn='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kgp='kubectl get pod'
alias kgpa='kubectl get pod --all-namespaces'
alias kgpvc='kubectl get pvc'
alias kgpv='kubectl get pv'
alias kgrs='kubectl get rs'
alias kgs='kubectl get svc'
alias kgsa='kubectl get sa'
alias kgsec='kubectl get secret'

# Commandes Describe
alias kdc='kubectl describe configmap'
alias kdcj='kubectl describe cronjobs'
alias kdd='kubectl describe deployment'
alias kding='kubectl describe ingress'
alias kdj='kubectl describe jobs'
alias kdn='kubectl describe nodes'
alias kdp='kubectl describe pod'
alias kdrs='kubectl describe rs'
alias kds='kubectl describe svc'
alias kdsa='kubectl describe sa'
alias kdsec='kubectl describe secret'

# Commandes Delete
alias kdel='kubectl delete -f'
alias kdelcj='kubectl delete cronjobs'
alias kdelc='kubectl delete configmap'
alias kdeld='kubectl delete deployment'
alias kdeling='kubectl delete ingress'
alias kdelj='kubectl delete jobs'
alias kdelns='kubectl delete namespace'
alias kdelp='kubectl delete pod'
alias kdelpv='kubectl delete pv'
alias kdelpvc='kubectl delete pvc'
alias kdelrs='kubectl delete rs'
alias kdels='kubectl delete svc'
alias kdelsa='kubectl delete sa'
alias kdelsec='kubectl delete secret'

# Commandes Apply
alias kap='kubectl apply -f'
alias kdry='kubectl apply --dry-run=client -f'
alias kapplyk='kubectl apply -k'

# Logs et Exec
alias kexec='kubectl exec -it'
alias kexect='kubectl exec --tty'
alias klogs='kubectl logs'

# Divers Kubernetes
alias kctx='kubectl config current-context'
alias kport='kubectl port-forward'
alias ktopn='kubectl top node'
alias ktopp='kubectl top pod'
alias ktop='kubectl top'
alias kuse='kubectl config use-context'
alias k9s-update="curl -sS https://webinstall.dev/k9s | bash"
alias helm-docs='docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest'

#----- Alias Git -----
alias gst='git status'
alias gco='git checkout'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit -a -m'
alias gaa='git add .'
alias gap='git add -p'
alias gc='git commit'
alias gpr='git pull --rebase'
alias gpl='git pull'
alias gps='git push'
alias gpsh='git push'
alias gpsf='git push --force'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbv='git branch -v'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gm='git merge'
alias gmt='git mergetool'
alias grm='git rm'
alias gmv='git mv'
alias gri='git rebase --interactive'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gstash='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gsts='git stash save'
alias gcl='git clone'
alias gcf='git config --list'
alias gbl='git blame'
alias gt='git tag'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gup='git fetch && git rebase'
alias gfi='git fetch --interactive'
alias grh='git reset --hard'
alias gru='git reset --soft HEAD~1'
alias grv='git revert'

#----- Autres Alias -----
alias krg='rg --smart-case --follow --glob "!*.gz" --multiline --multiline-dotall -A 3 -B 2 -C 2 -e'
alias bcat="bat --paging=never --style=plain --wrap=never"
compdef _bat bcat

#----- Alias SSH -----

#----- Alias Claude -----
# claude is now installed at ~/.local/bin/claude (via official installer)
alias cdf='claude --dangerously-skip-permissions'
alias analyze='npx gitnexus analyze'
alias openclaw-restart='openclaw gateway restart'
