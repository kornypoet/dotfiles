# explicitly set shell
export SHELL=/bin/zsh

# aliases

alias ls="ls -FG"
alias em="/Applications/Emacs.app/Contents/MacOS/Emacs"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# prompt

autoload -U colors && colors
# allow command substitution in the prompt
setopt PROMPT_SUBST

PROMPT='%{$fg[yellow]%}[%{$fg[cyan]%}%m%{$fg[yellow]%}] %{$fg[blue]%}%3~ %{$fg[yellow]%}%% %{$reset_color%}'

# completion

# match uppercase from lowercase

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# cluster chef
export CHEF_ORGANIZATION=infochimps_v2
export CHEF_USER=dempseyt
export CHEF_HOMEBASE=/Users/travis/ics/sysadmin/infochimps_homebase
export CHEF_REPO_ROOT=$HOME/ics/sysadmin

# rubylib
export RUBYLIB=$RUBYLIB:~/ics/senor_armando/lib
export RUBYLIB=$RUBYLIB:~/ics/icss/lib
export RUBYLIB=$RUBYLIB:~/ics/troop/lib

export JRUBYLIB=/usr/local/Cellar/jruby/1.6.5/jruby/lib/ruby/site_ruby/1.8:/usr/local/Cellar/jruby/1.6.5/jruby/lib/ruby/site_ruby/shared:/usr/local/Cellar/jruby/1.6.5/jruby/lib/ruby/1.8
# export RUBYLIB=$RUBYLIB:$JRUBYLIB
#  history

HISTFILE=~/.history/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

