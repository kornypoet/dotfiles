### Prompt ###

# Use zsh short color names
autoload -U colors && colors

# Allow command substitution in the prompt
setopt prompt_subst

# Save git status before each prompt display
function precmd {
  $(git status 2> /dev/null >! $HOME/.git-status-for-prompt)
}

# Display colored git branch if we are in a git repo
function _git_colored_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(_git_color_status)(${ref#refs/heads/}$(_git_commits))"
}

# Append git commit difference to prompt
function _git_commits() {
  git_info=$(cat $HOME/.git-status-for-prompt)
  if [ -n "$(echo $git_info | grep "Your branch is behind")" ] ; then
    difference="-"
  elif [ -n "$(echo $git_info | grep "Your branch is ahead of")" ] ; then
    difference="+"
  fi
  if [ -n $difference ] ; then
    difference+=$(echo $git_info | grep "Your branch is" | sed "s/Your branch is .* by//g" | sed "s/[^0-9]//g")
    echo $difference
  fi
}

# Change colors depending on git status
function _git_color_status() {
  git_info=$(cat $HOME/.git-status-for-prompt)
  if [ -n "$(echo $git_info | grep "Changes not staged")" ] ; then
    echo "%{$fg[red]%}"
  elif [ -n "$(echo $git_info | grep "Changes to be committed")" ] ; then
    echo "%{$fg[yellow]%}"
  elif [ -n "$(echo $git_info | grep "Untracked files")" ] ; then
    echo "%{$fg[cyan]%}"
  else
    echo "%{$fg[green]%}"
  fi
}

# User-defined hostname or default hostname
function _display_hostname() {
  if [[ -r /etc/node_name ]] ; then
    cat /etc/node_name
  else
    echo "%m"
  fi
}

# Custom prompt
PROMPT='%{$fg[cyan]%}$(_display_hostname)%{$fg[yellow]%} :: %{$fg[blue]%}%3~$(_git_colored_prompt) %{$fg[yellow]%}%% %{$reset_color%}'
