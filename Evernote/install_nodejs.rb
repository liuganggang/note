# Centos 6.5

yum install libtool automake autoconf gcc-c++ openssl-devel
# 下载源码
http://nodejs.org/dist/v0.10.32/node-v0.10.32.tar.gz

#安装nodejs

cd /usr/local/src
mkdir /usr/local/node
tar zxvf node-v0.9.0.tar.gz
cd node-v0.9.0
./configure --prefix=/usr/local/node
make
make install
vi /etc/profile
在export PATH USER 。。。一行的上面添加如下内容，并将NODE_HOME/bin设置到系统path中
#set for nodejs
export NODE_HOME=/usr/local/node
export PATH=$NODE_HOME/bin:$PATH
:x   //保存退出后执行如下命令，使刚才的配置生效
source /etc/profile

# 查看passenger root 目录
passenger-config --root

passenger_root /usr/lib/ruby/1.8/phusion_passenger/locations.ini;
passenger_ruby /usr/local/rvm/gems/ruby-2.0.0-p643/wrappers/ruby;


