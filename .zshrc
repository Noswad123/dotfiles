# ENV variables stored in ~/.zenv
source ~/.zshenv
source ~/.custom-aliases
source ~/.6rs-custom-aliases

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.nodenv/bin:/usr/local/bin:/Users/${USER}/.local/bin/:/Applications/DBeaver.app/Contents/MacOS:$HOME/.anyenv/bin:$PATH

eval "$(anyenv init -)"
eval "$(nodenv init -)"

# Path to your oh-my-zsh installation.
export ZSH="/home/${USER}/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source <(kubectl completion zsh)
