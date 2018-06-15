# 安装
curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent3.sh | sh

sudo /etc/init.d/td-agent start
sudo /etc/init.d/td-agent stop
sudo /etc/init.d/td-agent restart
sudo /etc/init.d/td-agent status


curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test

# 配置文件
/etc/td-agent/td-agent.conf

# 日志
/var/log/td-agent/td-agent.log









