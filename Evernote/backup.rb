服务器数据库备份方法
gem install backup --no-ri --no-rdoc 不放到Gemfile中

出现crontab 有任务,但是不执行备份的问题.
手动 backup perform -t 却有效.

解决办法:
in schedule.rb.
# don't use bundle exec
job_type :backup, "cd :path && rvm 2.0.0 do backup perform -t xinyi"

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

# clockwork
# 不是用bundle install 的gem 命令 用 Bundler.with_clean_env 来执行
every(1.days, "backup mysql", :at => '00:10') do
  Clockwork.wrapper('备份数据库') do
    Bundler.with_clean_env do
      system "backup perform -t my_mall"
    end
  end
end

