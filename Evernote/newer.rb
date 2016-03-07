## 基本操作 流程命令
mkdir work
# work 目录放置项目代码
cd work

# github fork 1份 Yggc OA 代码
# 换你自己fork 的仓库地址
git clone git@github.com:liuganggang/OA.git

cd OA

# 添加 主代码仓库 访问权限
git remote add yggc git@github.com:yggc/OA.git

# 代码更新 提交流程
# 每次提交代码前 需先更新 主仓库, 保证代码最新
git pull --rebase yggc master

# 做完1次commit 后, push到自己的仓库

git push origin master

# 没有问题后 github.com 上 发pull-request 申请合并代码

# 修改代码 做commit
git add .  # 将本地所有代码 添加到缓存区  缓存区的所有文件都是待commit的
git commit -m 'first commit'

# 查看提交记录
git log

# 正在修改的代码, 存草稿
git add .
git stash

git stash pop # 会把草稿还原出来.

# 解决冲突,
# 如果 git pull --rebase yggc master 拉最新代码的时候有冲突,
# 我们需要解决冲突文件,然后才能完成本次更新代码.

git diff #查看冲突 文件, 文件内容 冲突地方 会用 <<<<<<< 标识出来.

# 修改掉冲突文件后
git add .
git rebase --continue #继续拉代码 刚才拉到1半冲突了, 如果还有冲突 循环解决.

#解决完所有冲突后 就可以
git push origin master
#如果发现 push的时候报错 reject了 说明 你自己的仓库版本太老了, 需要覆盖本地最新代码
git push origin master -f # -f 强制覆盖


































