export SHELL="/usr/bin/zsh"
export PATH="/usr/bin:/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.config/script"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

export PATH="$PATH:/home/thomas/.local/share/JetBrains/Toolbox/scripts"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
plugins=(
  git
  sudo
  gh
  web-search
  archlinux
  zsh-syntax-highlighting
  zsh-autosuggestions
  copyfile
  copybuffer
  dirhistory
  tmux
)
ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# FZF Keybindings (wenn nötig)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -s '^f' '~/.config/script/tmux-sessionizer\n'
bindkey -s '^n' 'nvim $(fzf)\n'



function server {
  local SESSION="webserver_ssh"
  local HOST="root@212.227.48.137"  # Ersetze diesen Wert mit deinen Zugangsdaten

  if [[ -z "$TMUX" ]]; then
    tmux new-session -A -s "$SESSION" "ssh $HOST"
  else
    tmux new-window -n "$(echo $HOST | cut -d'@' -f2)" "ssh $HOST"
  fi
}
function raspi {
  local SESSION="raspi_ssh"
  local HOST="ssh thomas@192.168.0.9"  # Ersetze diesen Wert mit deinen Zugangsdaten

  if [[ -z "$TMUX" ]]; then
    tmux new-session -A -s "$SESSION" "ssh $HOST"
  else
    tmux new-window -n "$(echo $HOST | cut -d'@' -f2)" "ssh $HOST"
  fi
}



HISTFILE=~/.zsh_history HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Aliase
alias e="exit"
alias c='clear'
alias reload_zsh="source ~/.zshrc"
alias update="sudo pacman -Syu && yay -Syu --noconfirm"
alias lg="lazygit"
alias tree="tree -L 3 -a -I '.git' --charset X "
alias dtree="tree -L 3 -a -d -I '.git' --charset X "
alias ls="eza --no-filesize --long --color=always --icons=always --no-user" 
alias gau='~/.dotfiles/script/.config/script/git-auto.sh'

alias v="nvim"
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git log --oneline --graph --decorate --all"
alias python="python3"

# Zoxide 
eval "$(zoxide init --cmd cd zsh)"



# Oh My Posh Theme
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh_themes/catppuccin_mocha.omp.json)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

 read "PROJECT?Wie soll dein Symfony-Projekt heißen? "

  mkdir "$PROJECT" && cd "$PROJECT" || return 1

  ddev config --project-type=symfony --docroot=public
  ddev start
  ddev composer create symfony/skeleton

  echo "x" | ddev composer require webapp

  ddev launch
}

