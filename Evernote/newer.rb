## 基本操作 流程命令
mkdir work

cd work

# 换你自己fork 的仓库地址
git clone git@github.com:liuganggang/repo.git

cd repo

# 添加 主代码仓库 访问权限
git remote add yggc git@github.com:yggc/repo.git

# 代码更新 提交流程
# 每次提交代码前 需先更新 主仓库, 保证代码最新
git pull --rebase yggc master

# 做完1次commit 后, push到自己的仓库

git push origin master

# 没有问题后 github.com 上 申请合并代码

