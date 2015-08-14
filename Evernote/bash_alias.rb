# Source customer alias file
if [ -f ~/.bash_alias ]; then
        source .bash_alias
fi

# in .bash_alias file

alias ttr='touch tmp/restart.txt'
alias rdm='RAILS_ENV=production bundle exec rake db:migrate'
alias rap='RAILS_ENV=production bundle exec rake assets:precompile'
alias tf="tail -f log/production.log"
alias gpox='git pull origin sun_ego'
alias sunstart="RAILS_ENV=production bundle exec rake sunspot:solr:start"
alias sunstop="RAILS_ENV=production bundle exec rake sunspot:solr:stop"
alias sunreindex='RAILS_ENV=production bundle exec rake sunspot:solr:reindex'
alias railsc="rails c production"
alias rcc="RAILS_ENV=production bundle exec rake cache:clear"
alias sun_ego='cd /yigou/sun_ego'