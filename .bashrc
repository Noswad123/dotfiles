export PGHOST=localhost
export PGUSER=6river
export PGPASSWORD=6river
export WFM_LOCAL_DIR_MOUNTPOINT=${HOME}/src/db/wfm
eval "$(nodenv init -)"
export PATH=/Users/jdawson/.local/bin:$PATH
alias config='/usr/bin/git --git-dir=/Users/jdawson/.cfg/ --work-tree=/Users/jdawson'
export VAULT_ADDR=https://vault.6river.org
export WFM_DATA_MOUNTPOINT=${HOME}/src/db/data/mfp-debug/wfm
. "${XDG_CONFIG_HOME:-$HOME/.config}/6rs-artifactory/artifactory-access"
