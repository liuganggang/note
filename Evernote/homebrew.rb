brew update

brew doctor

brew switch mysql 5.5.29

# 更新系统 需要重新连接软件, 经常装不了gem
brew list -1 | while read line; do brew unlink $line; brew link $line; done

# 重新安装 mysql 5.7.9 需要鞋子mysql2 gem. 重新安装Installing mysql2 0.3.18 with native extensions
gem uninstall mysql2

bundle install