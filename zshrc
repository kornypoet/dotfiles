# aliases

alias ls="ls -FG"
alias la="ls -lah"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# prompt

autoload -U colors && colors
# allow command substitution in the prompt
setopt PROMPT_SUBST

PROMPT='%{$fg[cyan]%}%m%{$fg[yellow]%} :: %{$fg[blue]%}%3~$(git_colored_prompt) %{$fg[yellow]%}%% %{$reset_color%}'

# completion

# match uppercase from lowercase

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='2;32'

# rubylib

export RUBYLIB=$RUBYLIB:~/ics/senor_armando/lib
export RUBYLIB=$RUBYLIB:~/ics/icss/lib
#  history

HISTFILE=~/.history/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# git

# get the name of the branch we are on
function git_colored_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(git_color_status)(${ref#refs/heads/}$(git_commits))"
}

function git_commits() {
  commits=$(git cherry | grep "^+" 2> /dev/null) || return
  num=$(echo $commits | wc -l | sed -e 's/[ ]*//' 2> /dev/null)
  echo "+$num"
}

function git_color_status() {
  git_info=$(git status 2> /dev/null)
  if [ -n "$(echo $git_info | grep "Changes not staged")" ]; then
    echo "%{$fg[red]%}"
  elif [ -n "$(echo $git_info | grep "Changes to be committed")" ]; then
    echo "%{$fg[yellow]%}"
  elif [ -n "$(echo $git_info | grep "Untracked files")" ]; then
    echo "%{$fg[cyan]%}"
  else
    echo "%{$fg[green]%}"
  fi
}