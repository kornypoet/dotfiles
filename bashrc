function _working_dir() {
  echo -n "${PWD/#$HOME/~}" | ruby -e "pieces = \$stdin.read.split(/\//) ; if pieces.length >=3 ; puts pieces[-3..-1].join(\"/\") ; else ; puts pieces.join(\"/\") ; end"
}

function _stash_git_prompt() {
  git status 2>&1 > $HOME/.git-status-for-prompt-bash
}

# Display colored git branch if we are in a git repo
function _colored_git_repo() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo -e "$(_git_color_status)(${ref#refs/heads/})"
}

# Change colors depending on git status
function _git_color_status() {
  git_info=$(cat $HOME/.git-status-for-prompt-bash)
  if [ -n '$(echo ${git_info} | grep "Changes not staged")' ] ; then
    echo "\033[0;31m"
  elif [ -n '$(echo ${git_info} | grep "Changes to be committed")' ] ; then
    echo "\033[0;33m"
  elif [ -n '$(echo ${git_info} | grep "Untracked files")' ] ; then
    echo "\033[0;36m"
  else
    echo "\033[0;32m"
  fi
}

export PROMPT_COMMAND=_stash_git_prompt

export PS1='\[\033[0;36m\]\h \[\033[0;33m\]:: \[\033[0;34m\]$(_working_dir)$(_colored_git_repo) \[\033[0;33m\]%\[\033[0m\] '

alias ls="ls -FG"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
