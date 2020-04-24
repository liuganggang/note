# logstash 用法

bin/logstash -e

bin/logstash -f /etc/logstash.d/

bin/logstash -l logs/logstash.log
# 测试配置文件是否语法正确
bin/logstash -t

# 插件list
bin/logstash-plugin list

bin/logstash-plugin install sth

# local安装插件
bin/logstash-plugin install path/to/sth.gem

# 升级插件
bin/logstash-plugin update sth







































