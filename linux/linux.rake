#常用命令
  tar -czvf emall.tar.gz emall.sql
  tar -xzvf emall.tar.gz

	basename work/meyer.zip        return meyer.zip
	dirname work/meyer.zip           return work

	ls -l --time=atime production.log

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

# yum
  yum install software
  yum uninstall software
  yum list (all | installed | recent | updates)
  yum info packagename


cat development.log| grep --context=3 '/auth_callbacks/forward' | less


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













