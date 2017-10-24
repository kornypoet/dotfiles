### Environment Variables ###

# Explicitly set shell
export SHELL=/bin/zsh

# Explicitly set editor
export EDITOR=emacs

# Add dotfiles bin to load path
export PATH=$HOME/.dotfiles/bin:$PATH

# Colorized grep output
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32'

# Chef
export CHEF_USER=dempseyt

# Word navigation
export WORDCHARS=''

# Puppet dev constants
export PUPPET_MODULES_DIR=$HOME/venmo/puppet-modules
export SEC_DIR=$HOME/venmo/sec
export EYAML_KEYS_DIR=$SEC_DIR/eyaml_keys

# Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/venmo
# source /usr/local/bin/virtualenvwrapper.sh