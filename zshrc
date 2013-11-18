# Source all profile configurations 
for zsh_source in $HOME/.dotfiles/zsh.d/*; do
  source $zsh_source
done

# Setup rbenv
eval "$(rbenv init -)"
     
# key bindings
bindkey '^[[5C' forward-word
bindkey '^[[5D' backward-word

# Change the definition for shell word navigation 
export WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"