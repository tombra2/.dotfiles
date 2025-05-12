
# ---------------------------
# Shell & Pfade
# ---------------------------
export SHELL="/usr/bin/zsh"
export EDITOR=nvim
export PATH="/usr/bin:/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.config/script:$HOME/.local/share/JetBrains/Toolbox/scripts"

# ---------------------------
# Oh My Zsh Setup
# ---------------------------
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  sudo
  gh
  web-search
  archlinux
  copyfile
  copybuffer
  dirhistory
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting 
  zsh-autocomplete)

ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# ---------------------------
# Zsh Optionen & Verlauf
# ---------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# ---------------------------
# FZF & Keybindings
# ---------------------------
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -s '^f' '~/.config/script/tmux-sessionizer\n'
bindkey -s '^n' 'nvim $(fzf)\n'

# ---------------------------
# Tmux Autostart
# ---------------------------
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# ---------------------------
# SSH Funktionen
# ---------------------------
server() {
  local SESSION="webserver_ssh"
  local HOST="root@212.227.48.137"
  if [[ -z "$TMUX" ]]; then
    tmux new-session -A -s "$SESSION" "ssh $HOST"
  else
    tmux new-window -n "$(echo $HOST | cut -d'@' -f2)" "ssh $HOST"
  fi
}

raspi() {
  local SESSION="raspi_ssh"
  local HOST="thomas@192.168.0.9"
  if [[ -z "$TMUX" ]]; then
    tmux new-session -A -s "$SESSION" "ssh $HOST"
  else
    tmux new-window -n "$(echo $HOST | cut -d'@' -f2)" "ssh $HOST"
  fi
}

# ---------------------------
# Aliase
# ---------------------------
alias e="exit"
alias c='clear'
alias reload_zsh="source ~/.zshrc"
alias update="sudo pacman -Syu && yay -Syu --noconfirm"

alias lg="lazygit"
alias ls="eza --no-filesize --long --color=always --icons=always --no-user"
alias tree="tree -L 3 -a -I '.git' --charset X"
alias dtree="tree -L 3 -a -d -I '.git' --charset X"

# Git Shortcuts
alias g="git"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git log --oneline --graph --decorate --all"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias v="nvim"

# Tools
alias python="python3"
alias gau='~/.dotfiles/script/.config/script/git-auto.sh'
alias fd='cd "$(find . -type d | fzf)"'
alias fh='history | fzf'

# ---------------------------
# Zoxide
# ---------------------------
eval "$(zoxide init --cmd cd zsh)"

# ---------------------------
# Oh My Posh
# ---------------------------
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh_themes/robbyrussell.omp.json)"

# ---------------------------
# SDKMAN
# ---------------------------
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# ---------------------------
# Pyenv
# ---------------------------
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# ---------------------------
# Envman
# ---------------------------
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

