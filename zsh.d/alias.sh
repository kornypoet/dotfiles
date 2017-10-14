### Aliases ###

# Colorized and classified file listings
alias ls="ls -FG"

# Colorized and classified file listings using non-BSD version of ls
# alias ls="ls -F --color=auto"

# Show hidden files with human-readable size in list form
alias la="ls -lah"

# Emacs alias
alias e="emacs"

# Use brew installed emacs if it exists
if [[ -x /usr/local/Cellar/emacs/25.2/bin ]] ; then
    alias gmacs="/usr/local/Cellar/emacs/25.2/bin/emacs"
    alias emacs="/usr/local/Cellar/emacs/25.2/bin/emacs -nw"
    alias emacsclient="/usr/local/Cellar/emacs/25.2/bin/emacsclient"
fi

if [ -n "$INSIDE_EMACS" ]; then
    alias emacs="emacs-within-emacs"
fi

# Start emacsclient as a terminal and start server if not running
function et() {
    emacsclient -t --eval "(progn (multi-term) (rename-buffer \"${1:-jj}\"))" -a ""
}

# When inside emacs open a new buffer instead of a frame
function emacs-within-emacs() {
    emacsclient -n "$@"
}

# Make directory navigation easier
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Docker alias
alias d="docker"

# Vagrant alias
alias v="vagrant"

# Useful bundle shorcuts
alias b="bundle"
alias brb="bundle console"

function be() {
    bundle exec "$@"
}

function bk() {
    bundle exec knife "$@"
}

function bake() {
    bundle exec rake "$@"
}

function bspec() {
    bundle exec rspec "$@"
}

function bcuc() {
    bundle exec cucumber "$@"
}

# Git related shortcuts
alias g="hub"

# Create a gist from a file, name it after that file, and copy URL to clipboard
function gst() {
    gist -c -f "$@" < "$@"
}

# Random alphanumeric password generator
# Specify an output length as an argument, defaults to 8
function randpwd() {
    length=${1:-8}
    openssl rand -base64 128 | tr -cd "[:alnum:]" | head -c $length ; echo
}

function eyedit() {
    eyaml edit --pkcs7-private-key $SEC_DIR/eyaml_keys/$1_private_key.pkcs7.pem \
	  --pkcs7-public-key $SEC_DIR/eyaml_keys/$1_public_key.pkcs7.pem \
	  $PUPPET_MODULES_DIR/environments/hieradata/$1_environment.eyaml
}
