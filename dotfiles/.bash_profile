# Alias
alias git-clean='git fetch --prune && git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias good="git checkout master && git pull && git-clean"
