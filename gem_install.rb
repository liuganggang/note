gem install puma -v 2.13.4 -- --with-opt-dir=/usr/local/opt/openssl

brew install imagemagick@6
PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick@6/6.9.9-51/lib/pkgconfig/ gem install rmagick -v '2.16.0'


# 命令行调试 错误界面监控
gem 'pry-rails', '~> 0.3.5'
gem 'better_errors', '~> 2.1', '>= 2.1.1'
gem 'binding_of_caller', '~> 0.7.2'
gem 'thin'
