# ~/.zshrc - Beautiful shell configuration

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme (choose one)
# Option 1: Powerlevel10k (most popular)
# ZSH_THEME="powerlevel10k/powerlevel10k"
eval "$(starship init zsh)"

# Option 2: Use Starship instead (comment out P10k line above)
# eval "$(starship init zsh)"

# Plugins
plugins=(
    git
    docker
    docker-compose
    kubectl
    npm
    node
    python
    pip
    vscode
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    colored-man-pages
    command-not-found
    extract
    web-search
)

source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Environment variables
export EDITOR="code"
export BROWSER="code"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# History configuration
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# Modern replacements for common commands
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cat='bat'
alias grep='rg'
alias find='fd'
alias top='htop'
alias tree='tree -C'

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias glog='git log --oneline --decorate --graph'

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'

# Development aliases
alias c='code'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias h='history'
alias hg='history | grep'
alias psg='ps aux | grep'

# Custom functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract function for various archive formats
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Auto-completion
autoload -U compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colored completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better completion for kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Welcome message
echo "🚀 Welcome to your beautiful dev container!"
echo "📦 Type 'help-dev' for development shortcuts"

# Help function for development
help-dev() {
    echo "Development Container Shortcuts:"
    echo "================================"
    echo "📁 Navigation:"
    echo "  ll, la, l    - Enhanced ls variants"
    echo "  ..., ....    - Quick directory navigation"
    echo "  mkcd <dir>   - Create and enter directory"
    echo ""
    echo "🔍 Search & Files:"
    echo "  cat <file>   - Enhanced file viewing (bat)"
    echo "  grep <term>  - Fast search (ripgrep)"
    echo "  find <term>  - Enhanced find (fd)"
    echo ""
    echo "📝 Git shortcuts:"
    echo "  g, ga, gc, gp, gl, gst - Common git commands"
    echo "  glog         - Pretty git log"
    echo ""
    echo "🐳 Docker shortcuts:"
    echo "  d, dc, dps   - Docker commands"
    echo ""
    echo "⚡ General:"
    echo "  c <file>     - Open in VS Code"
    echo "  extract <file> - Extract any archive"
    echo "  hg <term>    - Search history"
}