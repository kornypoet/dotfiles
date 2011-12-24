# aliases

alias ls="ls -FG"
alias la="ls -lah"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# prompt

autoload -U colors && colors
# allow command substitution in the prompt
setopt PROMPT_SUBST

PROMPT='%{$fg[cyan]%}%m%{$fg[yellow]%} :: %{$fg[blue]%}%3~$(git_prompt_info) %{$fg[yellow]%}%% %{$reset_color%}'


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
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(_git_prompt_color)(${ref#refs/heads/}$(_git_difference_from_track))"
}
_git_status() {
  git_info=$(git status 2> /dev/null)
  if [ -n "$(echo $git_info | grep "Changes not staged")" ]; then
    echo "changed"
  elif [ -n "$(echo $git_info | grep "Changes to be committed")" ]; then
    echo "pending"
  elif [ -n "$(git $git_info | grep "Untracked files")" ]; then
    echo "untracked"
  else
    echo "unchanged"
  fi
}

# _git_difference_from_track() {
#   git_info=$(git status 2> /dev/null)
#   if [ -n "$(echo $git_info | grep "Your branch is behind")" ]; then
#     difference="-"
#   elif [ -n "$(echo $git_info | grep "Your branch is ahead of")" ]; then
#     difference="+"
#   fi
# 
#   if [ -n $difference ]; then
#     difference+=$(echo $git_info | grep "Your branch is" | sed "s/Your branch is .* by//g" | sed "s/[^0-9]//g")
#     echo $difference
#   fi
# }

_git_prompt_color() {
    current_git_status=$(_git_status)
    if [ "changed" = $current_git_status ]; then
      echo "%{$fg[red]%}"
    elif [ "pending" = $current_git_status ]; then
      echo "%{$fg[yellow]%}"
    elif [ "unchanged" = $current_git_status ]; then
      echo "%{$fg[green]%}"
    elif [ "untracked" = $current_git_status ]; then
      echo "%{$fg[cyan]%}"
    fi
}