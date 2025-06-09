### Environment Variables ###

# Explicitly set shell
export SHELL=/bin/zsh

# Explicitly set editor
export EDITOR=emacsclient

# Add dotfiles bin to load path
export PATH=$HOME/.dotfiles/bin:$PATH

# Colorized grep output
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32'

# Word navigation
export WORDCHARS=''

# Golang
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# Rust
. "$HOME/.cargo/env"
