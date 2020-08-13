if [ -z ${COMP_USER} ]; then
	USER=jdawson
else
	USER=${COMP_USER}
fi


# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/.nodenv/bin:$PATH:$HOME/bin:/usr/local/bin:/Users/${USER}/.local/bin/:/Users/${USER}/.nodenv/shims/:$PATH

eval "$(nodenv init -)"

# Path to your oh-my-zsh installation.
	export ZSH="/Users/${USER}/.oh-my-zsh"

# ALIAS
 alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


cv() {
kubectl -n "$1" describe pods | grep "Image:" | awk '/plasma-column-/ { print }' | sed 's/.*plasma-column-[0-9]\{1,10\}\///' | sed 's/:/ /' | awk '/[0-9]+\.[0-9]+\.[0-9]/ { printf "%-30s %s\n", $1, $2 }' | sort | uniq
}
#postgres stuff
# variables stored in ~/.zenv

export PGHOST=localhost
export PGUSER=6river
export PGPASSWORD=6river

if [ -z ${PG_HOST} ]; then
else
#	export PGUSER=${PG_USER}
#	export PGPASSWORD=${PG_PASSWORD}
#	export PGHOST=${PG_HOST}
fi

# 6mon

#pm2
function plogs { pm2 logs --raw --lines 200 $1 | bunyan }
function pstart { pm2 start $1 }
function prestart { pm2 restart $1 }
function pstop { pm2 stop $1 }

function pwfm { pm2 restart mfp-core docker-ros mfp_config_client }

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

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export WFM_DATA_MOUNTPOINT=${HOME}/src/db/data/mfp-debug/wfm
export VAULT_ADDR=https://vault.6river.org
. "${XDG_CONFIG_HOME:-$HOME/.config}/6rs-artifactory/artifactory-access"
