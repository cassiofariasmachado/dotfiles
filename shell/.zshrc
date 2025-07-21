export ZSH="$HOME/.dotfiles"

# Setup plugins
plugins=(
  git
  docker
  docker-compose
  emoji
)

# Configure aliases and functions
source ~/.aliases
source ~/.functions

# Do OS dependant stuff
case `uname` in
  Darwin)
    # Commands for OS X go here

    
  ;;
  Linux)
    # Commands for Linux

    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  ;;
esac

# Finally start oh-my-posh
eval "$(oh-my-posh init zsh --config ~/default.omp.json)"
