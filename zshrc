# Source all profile configurations 
for zsh_source in $HOME/.dotfiles/zsh.d/* ; do
  source $zsh_source
done

# Setup rbenv
if [[ -n `type rbenv | grep -v 'not found'` ]] ; then
  eval "$(rbenv init -)"
fi
