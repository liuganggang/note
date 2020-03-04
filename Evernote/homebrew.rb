# 执行2次
brew update

brew doctor

brew switch mysql 5.5.29

# 更新系统 需要重新连接软件, 经常装不了gem
brew list -1 | while read line; do brew unlink $line; brew link $line; done


