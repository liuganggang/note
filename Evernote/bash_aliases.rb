# Source customer alias file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# in .bash_aliases file

# git
alias ggs='git status'
alias gpr='git pull --rebase'

# rails command
alias ras='bundle exec rails s'
alias rac='bundle exec rails c'
alias ras1='bundle exec rails s -p 4000'
alias ras2='bundle exec rails s -p 5000'
alias ras3='bundle exec rails s -p 6000'
alias ras4='bundle exec rails s -p 7000'

alias rdm='RAILS_ENV=production bundle exec rake db:migrate'
alias rap='RAILS_ENV=production bundle exec rake assets:precompile'
alias ttr='touch tmp/restart.txt'
alias tf="tail -f log/production.log"

alias sunstart="RAILS_ENV=production bundle exec rake sunspot:solr:start"
alias sunstop="RAILS_ENV=production bundle exec rake sunspot:solr:stop"
alias sunreindex='RAILS_ENV=production bundle exec rake sunspot:solr:reindex'
alias rcc="RAILS_ENV=production bundle exec rake cache:clear"
