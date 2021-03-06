gem install puma -v 2.13.4 -- --with-opt-dir=/usr/local/opt/openssl

brew install imagemagick@6
PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick@6/6.9.9-51/lib/pkgconfig/ gem install rmagick -v '2.16.0'


# plan 1
rvm install 2.3.0 --with-openssl-dir=$(brew --prefix openssl@1.0)

brew install rbenv/tap/openssl@1.0
rvm reinstall 2.3.8 --with-openssl-dir='/usr/local/opt/openssl@1.0'
gem update --system

# plan 2
$ rvm pkg install openssl
$ rvm remove 2.3.0
$ rvm install 2.3.0 --with-openssl-dir=$HOME/.rvm/usr
$ gem install bundler


CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.0)" RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.0)" rbenv install 2.3.0


# 命令行调试 错误界面监控
gem 'pry-rails', '~> 0.3.5'
gem 'better_errors', '~> 2.1', '>= 2.1.1'
gem 'binding_of_caller', '~> 0.7.2'
gem 'thin'


# therubyracer
brew tap homebrew/versions
brew install v8@3.15

gem install libv8 -v '3.16.14.19' -- --with-system-v8
gem install therubyracer -- --with-v8-dir=/usr/local/opt/v8@3.15

bundle lock --add-platform x86_64-linux





eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

# 微信号生成二维码地址
https://open.weixin.qq.com/qr/code?username=gh_3db8a402b230







