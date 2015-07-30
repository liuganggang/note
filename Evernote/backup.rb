服务器数据库备份方法
gem install backup 不放到Gemfile中

出现crontab 有任务,但是不执行备份的问题.
手动 backup perform -t 却有效.

解决办法:
in schedule.rb.

job_type :backup, "cd :path && rvm 2.0.0 do bundle exec backup perform -t xinyi"

every :day, :at => '2:00 am' do
  backup ""
end

重新更新crontab

whenever —update-crontab


# Cron

crontab -l
crontab -e
crontab -u www -l

# 查看cron运行日志
/var/log/syslog

