
## 配置服务器国内源
百度搜索 ubuntu 12.04 源 ,去ubuntu中文网有

替换/etc/apt/sources.list 文件, 更换快速源, 下载安装软件


deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse


```
刷新源
sudo apt-get update

更新所有软件
sudo apt-get upgrade

```

## 安装必要工具

```
sudo apt-get install htop tmux

sudo apt-get install curl libcurl4-openssl-dev
```

## 安装git

```
sudo apt-get install git

创建key
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

配置 github帐号
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

cat ~/.ssh/id_rsa.pub 添加到git ssh key中

测试帐号是否成功
ssh -T git@github.com

```

## 创建帐号

假设你已经用 root 帐号通过 SSH 登陆服务器。

出于安全考虑，不要使用 root 帐号运行 web 应用。这里新建一个专门用于部署的用户，例如 deploy 或者其它你喜欢的名字。运行以下命令创建用户：

```
useradd -m -s /bin/bash deploy

```

将用户加入 sudo 群组，以便使用 sudo 命令：

```
adduser deploy sudo

```

为 deploy 用户设置密码：

```
passwd deploy

```

退出当前 SSH 链接，用 deploy 帐号重新登陆。

## 安装 RVM 和 Ruby

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash -s stable

```

RVM 安装完毕后，重新登陆 SSH，让 RVM 配置生效。然后安装 Ruby 2.0.0：

```
rvm use --install --default 2.0.0
Ruby 安装过程会请求 `apt-get update` 的权限，并自动安装系统依赖。安装完毕后，确认目前的 Ruby 版本

rvm use 2.0.0@rails4_1_7 --create --default

```

修改 gem包下载地址, 淘宝源下载快
```
gem sources                        # 查看gem源
gem sources -r https://rubygems.org/     # 删除默认的gem源
gem sources -a https://gems.ruby-china.com/   # 增加taobao作为gem源
gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/

打开 ~/.gemrc
在最后加入 gem: --no-ri --no-rdoc

gem sources -c                     # 清空源缓存，可以不执行
gem sources -u                     # 更新源缓存，可以不执行

如果你使用 Gemfile 和 Bundle (例如：Rails 项目)
你可以用 Bundler 的 Gem 源代码镜像命令。

bundle config mirror.https://rubygems.org https://ruby.taobao.org
这样你不用改你的 Gemfile 的 source。

```

安装bundler

```
gem install bundler --pre

```

## 安装 Passenger

[Passenger](https://www.phusionpassenger.com/) 是一个 app server，支持基于 Rack 框架的 Ruby app（包括 Rails）。Passenger 的特点是需要作为模块编译到 Nginx 中，优点是配置简单，不需要自己写启动脚本。

安装 Passenger 最简单的方法是通过 apt 安装，首先导入 Passenger 的密钥（[官方文档](http://www.modrails.com/documentation/Users%20guide%20Nginx.html#install_on_debian_ubuntu)）：

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
```

安装 apt 插件以支持 https 传输：

```
sudo apt-get install apt-transport-https ca-certificates
```

添加 apt 源（对应 Ubuntu 12.04 LTS）：

```
$ sudo bash -c 'echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main" > /etc/apt/sources.list.d/passenger.list'
$ sudo apt-get update
```

安装 Passenger 的包：

```
$ sudo apt-get install nginx-extras passenger
```

现在修改 nginx 配置，编辑 `/etc/nginx/nginx.conf`，找到这两行注释：

```conf
# passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
# passenger_ruby /usr/bin/ruby;
```

将它修改为：

```conf
passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
passenger_ruby /home/deploy/.rvm/wrappers/default/ruby;
```

这会打开 Passenger 支持，并且指定使用之前用 rvm 安装的 ruby 版本。


# 一键简单方法 使用 passenger 安装 nginx
## gem安装passenger and nginx
```
gem install passenger

rvmsudo passenger-install-nginx-module

```

把项⽬上传到服务器。

创建站点文件夹：

```
$ sudo mkdir -p /var/www/xinyi
$ sudo chown deploy:deploy /var/www/xinyi
```

clone 项目文件：

```
$ cd /var/www/xinyi
$ git clone "github 上的地址" current
```

安装MySQL：

```
sudo apt-get install mysql-server mysql-client libmysqlclient-dev

```

JS运⾏行环境:

```
sudo apt-get install nodejs

```

ImageMagic依赖

```
sudo apt-get install imagemagick
```

如果上⾯面不⾏行⽤用下⾯面的

```
 sudo apt-get install libmagick++-dev
```

如有报错

```
 sudo apt-get install libmagickwand-dev
```

修改商城配置⽂文件:

```
 $ cd /var/www/xinyi/current/config
```

将下⾯面数据库配置代码添加到database.yml中

```
 development: &development
   adapter: mysql2
   encoding: utf8
   host: localhost
   reconnect: false
   database: xinyi
   pool: 5
   username: 数据库帐号
   password: 数据库密码
 production:
   <<: *development

```

执行 bundle 和 migrate：

```
 $ cd /var/www/xinyi/current
 $ bundle install
 $ RAILS_ENV=production rake db:create db:migrate
```

执行 assets precompile:

```
$ rake assets:precompile
```
## 修改 Nginx 配置

删除原有的默认网站配置：

```
$ rm /etc/nginx/sites-enabled/default
```

新建网站配置：

```
$ touch /etc/nginx/sites-enabled/xinyi.conf
```

编辑 `/etc/nginx/sites-enabled/xinyi.conf`，写入以下内容：

```conf
server {
    listen 80 default;
    server_name example.com; # 这里填写你真实域名
    root /var/www/xinyi/current/public;
    passenger_enabled on;
}
```
# 添加 nginx 用户
sudo adduser --system --no-create-home --shell /bin/false --group --disabled-login nginx

将其存为/etc/init.d/nginx，之后修改权限

chmod a+x /etc/init.d/nginx
ln -s /opt/nginx/sbin/nginx /usr/local/bin/

以后启动nginx可用 sudo service nginx start, or sudo nginx

开机启动nginx
sudo update-rc.d -f nginx defaults

## 完成

在浏览器打开服务器的 IP 地址或域名，应该看到你的网站在运行。