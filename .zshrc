if [ -z ${COMP_USER} ]; then
	USER=jambot
else
	USER=${COMP_USER}
fi


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.nodenv/bin:$HOME/bin:/usr/local/bin:/Users/${USER}/.local/bin/:/Users/${USER}/.nodenv/shims/:"$(npm bin -g):$PATH"

eval "$(nodenv init -)"

# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"

# ALIAS
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias home='cd ~'
alias root='cd /'
alias o=open
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

# Common project directories
alias projects='cd ~/Projects/'


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

# git
function gmain { git switch main }
function gdelete { git branch -d $1 }

function gprep {
	git branch > gclean.txt
	echo -e "Delete this line and branches you want to save (main, origin, etc)\n$(cat gclean.txt)" > gclean.txt | vim -
	echo "Preparing to delete following branches:"
	cat delete.txt
	while read i ; do gdelete $i ; done < delete.txt
	rm gclean.txt
	rm delete.txt
	echo "\nGoodbye"
}

# 6mon

#pm2
function plogs { pm2 logs --raw --lines 200 $1 | bunyan }
function pstart { pm2 start $1 }
function prestart { pm2 restart $1 }
function pstop { pm2 stop $1 }
function pwfm { pm2 restart mfp-core docker-ros mfp_config_client }

#dev environment commands
function devreset { ~/src/mgl-incident-tools/bin/truncate-job-tables.sh --dev}

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

export WFM_DATA_MOUNTPOINT=${HOME}/src/db/data/mfp-debug/wfm
export VAULT_ADDR=https://vault.6river.org
. "${XDG_CONFIG_HOME:-$HOME/.config}/6rs-artifactory/artifactory-access"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Top ten commands function
function commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}

alias topten="history | commands | sort -rn | head"
