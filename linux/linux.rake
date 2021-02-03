#常用命令
  tar -czvf emall.tar.gz emall.sql
  tar -xzvf emall.tar.gz

	basename work/meyer.zip        return meyer.zip
	dirname work/meyer.zip           return work

	ls -l --time=atime production.log

  ls -lR|grep "^-"| wc -l # 查询文件数量
  ls -lR|grep "^d"| wc -l # 查询文件夹数量

  ls -lR 201010*|grep "^-"| wc -l # 查询文件开头的数量

	chattr -i file
	chattr -a file

  sed -n '10,20p' Gemfile
  sed -n '/ruby/p' Gemfile
  sed '1,10d' Gemfile

  Linux压缩保留源文件的方法：
  gzip –c filename > filename.gz
  Linux解压缩保留源文件的方法：
  gunzip –c filename.gz > filename


# tmux
  tmux list-sessions

  tmux new-session -s rails

  tmux a -t rails 恢复rails窗口

  tmux kill-session -t rails 杀死rails 窗口

  tmux kill-server

# useradd

  useradd -u 666 -g zhugroup -G fushugroup1,fushugroup2 -d /home/mydir -s bin/bash newuser

  usermod -u 888 newuser

  userdel newuser
  userdel -r newuser # del account with home dir

  groupadd group2

  groupmod -n newgroup group2
  groupmod -g 999 newgroup

  umask 022  # create new file or new dir default permission,
             # file is 666 - 022, dir is 777 - 022.
  chmod u+s newfile  # set suid , running as it's user in thread
  chmod g+s newdir   # set sgid , use the same group as new create children file
  chmod o+t newdir   # set sticky, if can write files in dir , then can not delete other people's file when set stiky.
  chmod 4777 newdir  # suid = 4, sgid = 2, sticky = 1;

# ifconfig
  ifconfig -a
  ifconfig eth0

  setup

  ifup
  ifdown

  host www.baidu.com
  dig www.baidu.com

# 重定向
  # 0  STDIN
  # 1  STDOUT
  # 2  STDERR
  echo "asdf" > outfile
  echo "adfasdf" >> outfile
  ls nothing 2> errorfile
  ls -ld 2>&1 allfileinfo
  grep linuxcast < /etc/passwd

  find / -user liugang 2> /dev/null | grep Video

  find /opt/db_backup -mtime +7 -delete # 超过7天的文件 删除掉

# 全文搜索
  grep login_method . -r
  cat development.log| grep --context=3 '/auth_callbacks/forward' | less

# yum
  yum install software
  yum uninstall software
  yum list (all | installed | recent | updates)
  yum info packagename

# 临时在当前命令行修改数量
ulimit -n 131072

增加系统文件描述符的最大数量

通过ulimit查看当前的文件描述符的最大数量：

$ ulimit -n
如果是1024，那是远远不够的，将下面4行添加到 /etc/security/limits.conf 中，重启机器。

root soft nofile 65536
root hard nofile 65536
* soft nofile 65536
* hard nofile 65536
之后用ulimit查看，应该是65536了。

# 修改locale 添加zh-CN.UTF-8
# 解决中文乱码
sudo vim /etc/locale.gen
sudo locale-gen

sudo apt-get install language-pack-zh-hans


# fail2ban 插件 做防火墙

#查看 ID
iptables -L -n -v --line-numbers
# 解封 ID
iptables -D f2b-ReqLimit 15

# 手动 封
iptables -I INPUT -s 222.186.180.6 -j DROP
iptables -I INPUT -s 121.40.156.235 -j DROP

iptables -I f2b-ReqLimit -s 183.193.120.45 -j DROP

# 查看puma 进程变化
watch -d 'ps aux --sort rss|grep puma'

# 重启先 kill 进程
RAILS_ENV=production bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml

bundle exec pumactl start
bundle exec pumactl stop
bundle exec pumactl phased-restart
bundle exec thin start -C
bundle exec thin start -C config/thin.yml


# redis 启动
./src/redis-server redis.confg --daemonize yes






