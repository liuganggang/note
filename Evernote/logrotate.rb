/opt/nginx/logs/error.log
{
      daily
      rotate 7
      missingok
      copytruncate
      compress
      notifempty
}

/var/www/salias/log/production.log /var/www/salias/log/newrelic_agent.log
{
      daily
      rotate 30
      create 0755 salias salias
      missingok
      copytruncate
      compress
      notifempty
}