# Source all profile configurations 
for zsh_source in $HOME/.dotfiles/zsh.d/* ; do
  source $zsh_source
done

# Setup rbenv
eval "$(rbenv init -)"
