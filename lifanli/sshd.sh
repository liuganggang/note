#!/bin/bash
cd /tmp

wget https://cloudflare.cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.7p1.tar.gz
wget http://www.zlib.net/zlib-1.2.11.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2p.tar.gz
wget https://www.openssl.org/source/openssl-1.1.1-pre9.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2p.tar.gz

# 安装 zlib
tar -zxvf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure
make
make install

# 安装 openssl
cd /tmp
tar -zxvf openssl-1.1.1-pre9.tar.gz
cd openssl-1.1.1-pre9
./config shared zlib
make
make install

mv /usr/bin/openssl /usr/bin/openssl_old
mv /usr/include/openssl /usr/include/openssl_old

ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl
ln -s /usr/local/ssl/include/openssl /usr/include/openssl

echo "/usr/local/ssl/lib" > /etc/ld.so.conf.d/openssl.conf
ldconfig
openssl version -a

# 安装 openssh7.7
cd /tmp
tar -zxvf openssh-7.7p1.tar.gz
cd openssh-7.7p1

./configure --prefix=/usr --sysconfdir=/etc/ssh  --with-zlib --with-ssl-dir=/usr/local/ssl  --with-md5-passwords --mandir=/usr/share/man
make
make insall

ssh -V

# 修改mysql密码
mysqld --skip-grant-tables
update user set password=password("123") where user="root";
flush privileges;

sudo mysql_upgrade -uroot -p --force
sudo service mysql restart



# 安装 openssh7.7 production
cd ~/ && mkdir ssh_update && cd ssh_update
wget https://cloudflare.cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.7p1.tar.gz
tar -zxvf openssh-7.7p1.tar.gz
cd openssh-7.7p1

./configure
make
sudo make install

service ssh restart
ssh -V



# nginx 升级 production
sudo nginx -s stop
mv /etc/nginx /etc/nginx_old
sudo apt-get remove nginx
sudo apt-get autoremove

cd ~/ && mkdir nginx_update && cd nginx_update

wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key

sudo vim /etc/apt/sources.list
# 将2个源添加到 sources.list
deb http://nginx.org/packages/ubuntu/ trusty nginx
deb-src http://nginx.org/packages/ubuntu/ trusty nginx

sudo apt-get update
sudo apt-get install nginx


cd /etc/nginx

sudo cp ../nginx_old/nginx.conf .
sudo cp ../nginx_old/ip_block.conf .
sudo rm sites-enabled/default

sudo nginx -s reload

























