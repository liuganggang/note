# 列出已知的ruby版本
rvm list known
# 安装一个ruby版本
rvm install 1.9.3
# 这里安装了最新的1.9.3, rvm list known列表里面的都可以拿来安装。

# download ruby-2.6.5.tar.bz2
# mv to .rvm/archives
# then install form local file
rvm --verify-downloads 2 --disable-binary install ruby-2.6.5

# 使用一个ruby版本
rvm use 1.9.3
# 如果想设置为默认版本，可以这样
rvm use 1.9.3 --default
# 如果想设置为默认版本, 并且创建gemset
rvm use 2.0.0@rails4 --create --default
# 查询已经安装的ruby
rvm list
# 卸载一个已安装版本
rvm remove 1.9.2

rvm gemset list
rvm gemset create rails4_1_7

# 如果你想清空一个gemset的所有gem,想重新安装所有gem，可以这样
rvm gemset empty 2.0.0@rails4_1_7

rvm gemdir
# /Users/liugang/.rvm/gems/ruby-2.1.3@rails417
rvm gemset clear

# 删除一个gemset
rvm gemset delete rails4_1_7

rvm use 2.0.0@4_1_7

# global 是安装共享gem 所有gemset都共享 比如bundler
rvm use 2.2.3@global
gem install bundler


rvm get stable

# 低版本ruby不兼容高版本rubygems 使用 rvm rubygems 安装低版本的才能使用
ruby 2.3.8
rvm rubygems 3.0.2 --force

# gpg install on mac
GPG signature verification failed for '/Users/huabei-ruby/.rvm/archives/rvm-1.29.12.tgz' - 'https://github.com/rvm/rvm/releases/download/1.29.12/1.29.12.tar.gz.asc'! Try to install GPG v2 and then fetch the public key:

    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

or if it fails:

    command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -



