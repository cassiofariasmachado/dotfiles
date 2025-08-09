export ZSH="$HOME/.dotfiles"

# +---------------+
# | Setup Plugins |
# +---------------+

plugins=(
  git
  docker
  docker-compose
  emoji
)

# +---------------------------+
# | Setup Aliases & Functions |
# +---------------------------+

source ~/.config/zsh/.aliases
source ~/.config/zsh/.functions

# +---------+
# | Kubectl |
# +---------+

## Export all kubeconfigs from ~/.kube/configs
KUBECONFIG_DIR=~/.kube/configs
export KUBECONFIG=$(find $KUBECONFIG_DIR -type f -name "*.yaml" -maxdepth 2 | tr '\n' ':' | sed 's/:$//')

# +-----+
# | NVM |
# +-----+

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# +------+
# | PATH |
# +------+

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# +-------------------+
# | Specific OS stuff |
# +-------------------+
case `uname` in
  Darwin)
    # Commands for OSX

    # Start oh-my-posh only using iTerm2
    if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
      eval "$(oh-my-posh init zsh --config ~/default.omp.json)"
    fi
  ;;
  Linux)
    # Commands for Linux

    # Set up brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # Set up oh-my-posh
    eval "$(oh-my-posh init zsh --config ~/default.omp.json)"
  ;;
esac
