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

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}"

_git_status() {
  if [ -n "$(git status | grep "Changes not staged")" ]; then
    echo "changed"
  elif [ -n "$(git status | grep "Changes to be committed")" ]; then
    echo "pending"
  elif [ -n "$(git status | grep "Untracked files")" ]; then
    echo "untracked"
  else
    echo "unchanged"
  fi
}

_git_difference_from_track() {
  if [ -n "$(git status | grep "Your branch is behind")" ]; then
    difference="-"
  elif [ -n "$(git status | grep "Your branch is ahead of")" ]; then
    difference="+"
  fi

  if [ -n $difference ]; then
    difference+=$(git status | grep "Your branch is" | sed "s/Your branch is .* by//g" | sed "s/[^0-9]//g")
    echo $difference
  fi
}

_git_prompt_color() {
    current_git_status=$(_git_status)
    if [ "changed" = $current_git_status ]; then
      echo "%{$fg_bold[red]%}"
    elif [ "pending" = $current_git_status ]; then
      echo "%{$fg_bold[yellow]%}"
    elif [ "unchanged" = $current_git_status ]; then
      echo "%{$fg_bold[green]%}"
    elif [ "untracked" = $current_git_status ]; then
      echo "%{$fg_bold[cyan]%}"
    fi
}

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
  echo "$(_git_prompt_color)(${ref#refs/heads/})"
}

# Get the status of the working tree
git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS="%{$fg[green]%}"
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi
  echo $STATUS
}
