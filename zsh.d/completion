### Completion ###

# Load completion module
autoload -U compinit && compinit

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# Homebrew completion
_brew() {
  if (( CURRENT == 2 )); then
    compadd list install uninstall link unlink missing prune cleanup update search 
    compadd upgrade update outdated info edit options deps uses home doctor 
  elif (( CURRENT >= 3 )); then
    if (( CURRENT == 3 )); then
      if [[ $words[2] == "options" || $words[2] == "info" || $words[2] == "edit" || $words[2] == "options" || $words[2] == "deps" || $words[2] == "uses" || $words[2] == "home" ]]; then
        compadd $(brew search ${words[3]})
      fi
    fi
    if [[ $words[2] == "install" ]]; then
      compadd $(brew search ${words[-1]})
    elif [[ $words[2] == "uninstall" ]]; then
      compadd $(brew list)
    elif [[ $words[2] == "cleanup" ]]; then
      compadd $(brew list --versions | grep ' .* ' | awk '{print $1}')
    elif [[ $words[2] == "upgrade" ]]; then
      compadd $(brew outdated | awk '{print $1}')
    fi
  fi
}

compdef _brew brew

# Rubygems completion
_gem() {
  if (( CURRENT == 2 )); then
    compadd build cert check cleanup repository contents dependency environment fetch generate_index help install list lock outdated 
    compadd push query rdoc search server sources for specification stale uninstall unpack update repository which owner pristine located
  elif (( CURRENT == 3 )); then
    if [[ $words[2] == "install" ]]; then
      if [[ ! -f $HOME/.remote-gem-cache ]]; then
        $(gem list -r > $HOME/.remote-gem-cache)
      fi
      compadd $(cat $HOME/.remote-gem-cache | grep "(" | awk '{print $1}')
    elif [[ $words[2] == "uninstall" || $words[2] == "which" || $words[2] == "update" || $words[2] == "dependency" ]]; then
      compadd $(gem list | grep "(" | awk '{print $1}')
    else;
    fi
  fi
}

compdef _gem gem

# Knife cluster completion
_knife() {
  if [[ -e $PWD/.chef ]]; then 
    local chef_homebase=`greadlink -f $PWD/.chef`/.. 
  elif [[ -e $HOME/.chef ]]; then
    local chef_homebase=`greadlink -f $HOME/.chef`/..
  fi
  if (( CURRENT == 2 )); then
    compadd -Q bootstrap client cluster configure cookbook "cookbook site" "data bag" environment exec help index node recipe role search ssh status tag
  elif (( CURRENT == 3 )); then
    if [[ $words[2] == "client" ]]; then  
      compadd -Q "bulk delete" create delete edit list reregister show
    elif [[ $words[2] == "cluster" ]]; then
      compadd bootstrap ssh kick kill launch list proxy show start stop sync vagrant
    elif [[ $words[2] == "configure" ]]; then       
      compadd -Q client
    elif [[ $words[2] == "cookbook" ]]; then       
      compadd -Q "bulk delete" create delete download list metadata "metadata from" show test upload
    elif [[ $words[2] == "environment" ]]; then       
      compadd -Q create delete edit "from file" list show
    elif [[ $words[2] == "node" ]]; then       
      compadd -Q "bulk delete" create delete edit "from file" list "run_list add" "run_list remove" show 
    elif [[ $words[2] == "recipe" ]]; then       
      compadd -Q list
    elif [[ $words[2] == "role" ]]; then
      compadd -Q "bulk delete" create delete edit "from file" list show
    elif [[ $words[2] == "tag" ]]; then
      compadd -Q create delete list       
    fi
  elif (( CURRENT == 4)); then
    if [[ $words[2] == "cluster" ]]; then
      compadd $( ls $chef_homebase/clusters | awk -F '.' '{print $1}' )
    elif [[ $words[2] == "cookbook" ]]; then
      compadd -Q $( ls $chef_homebase/cookbooks )
    elif [[ $words[2] == "role" ]]; then
      compadd -Q $( ls $chef_homebase/roles | awk -F '.' '{print $1}' )	
    fi
  fi
}

compdef _knife knife
