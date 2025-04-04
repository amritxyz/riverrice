# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt configuration
PS1="\n\[\e[38;5;66m\]\w\[\e[0m\] \
\$(git branch 2>/dev/null | grep \"*\" | sed \"s/*/(\e[38;5;108m&\e[0m)/\") \
\[\e[38;5;108m\]\$(jobs -p | wc -l | awk '{if (\$1>0) print \"+\"\$1}')\n\
\[\e[38;5;220m\]❯\[\e[0m\] "

# LS_COLORS configuration
export LS_COLORS='di=38;5;240:fi=38;5;248:ln=38;5;109:ex=38;5;113:'
eval "$(dircolors -b)"

# Default programs
export EDITOR="nvim"
export TERMINAL="foot"
export BROWSER="firefox"

# Environment variables
export PATH="$PATH:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export PYTHONSTARTUP="$HOME/.config/python/pythonrc"

# Shell options and settings
shopt -s autocd
stty -ixon -ixoff
export HISTSIZE=1000
export HISTFILESIZE=2000

# Aliases
alias grep='grep --color=auto'
alias ls='ls -F --color=auto'
alias l='ls -lF --color=auto'
alias la='ls -AF --color=auto'
alias ll='ls -lAF --color=auto'
alias c='clear'
alias t='tmux'
alias ta='tmux a'
alias e='exit'
alias torrent='deluge-gtk'
alias rr='cd $HOME/.config/river && ls -AF'
alias h='cd $HOME/ && ls -AF'
alias cf='cd $HOME/.config && ls -AF'
alias mu='cd $HOME/.local/music && ls -AF'
alias aud='cd $HOME/.local/audio && ls -AF'
alias dl='cd $HOME/.local/dl && ls -AF'
alias dox='cd $HOME/.local/dox && ls -AF'
alias dev='cd $HOME/.local/dev && ls -AF'
alias pra='cd $HOME/.local/practice && ls -AF'
alias vid='cd $HOME/.local/vids && ls -AF'
alias img='cd $HOME/.local/img && ls -AF'
alias sss='cd $HOME/.local/ss && ls -AF'
alias nt='cd $HOME/.local/dox/notes && ls -AF'
alias gitr='cd $HOME/.local/git-repos && ls -AF'
alias hs='cd $HOME/.local/hugo-dir && ls -AF'
alias hss='hugo server --noHTTPCache'
alias ff='fastfetch'
alias xi='sudo xbps-install'
alias xr='sudo xbps-remove -R'
alias xq='xbps-query'
alias ..='cd .. && ls -AF'
alias ...='cd ../../ && ls -AF'
alias yta-aac='yt-dlp --extract-audio --audio-format aac'
alias yta-best='yt-dlp --extract-audio --audio-format best'
alias yta-flac='yt-dlp --extract-audio --audio-format flac'
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3'
alias ytv-best='yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias mkdir='mkdir -p'
alias zzz='systemctl suspend'

# Camera
alias cam='mpv --untimed --no-cache --no-osc --no-input-default-bindings --profile=low-latency --input-conf=/dev/null --title=webcam $(ls /dev/video[0,2,4,6,8] | tail -n 1)'

# Git aliases
alias g='git'
alias gst='git status'
alias gc='git commit -m'
alias ga='git add'
alias gpl='git pull'
alias gpom='git push origin master'
alias gpu='git push'
alias gpuom='git push origin main'
alias gd='git diff'
alias gch='git checkout'
alias gnb='git checkout -b'
alias gac='git add . && git commit -m'
alias grs='git restore --staged .'
alias gre='git restore'
alias gr='git remote'
alias gcl='git clone'
alias gt='git ls-tree -r master --name-only'
alias gb='git branch'
alias gf='git fetch'
alias glg='git log --graph --abbrev-commit --decorate --format=format:"%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n%  C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'
