export PGHOST=localhost
export PGUSER=6river
export PGPASSWORD=6river
export WFM_LOCAL_DIR_MOUNTPOINT=${HOME}/src/db/wfm
eval "$(nodenv init -)"
export PATH=/Users/jdawson/.local/bin:$PATH
alias config='/usr/bin/git --git-dir=/Users/jdawson/.cfg/ --work-tree=/Users/jdawson'
