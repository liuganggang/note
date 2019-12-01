```
git tag

git tag -l 'v1.4.2.*'

git tag -a v1.0.0 -m '标签名字'

git show v1.0.0

git push origin v1.5     =>提交单个标签上去

git push origin --tags  => 提交所有标签上去

git rm --cached config/secret.yml.example
```

```
git config --global user.name 'liugang'

git config --global user.email 'you@example.com'

ssh-keygen -t rsa -b 4096 -C '501225658@qq.com'

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

chmod 600 authorized_keys
```

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author


git filter-branch --env-filter 'if [ "$GIT_AUTHOR_EMAIL" = "501225658@qq.com" ]; then
 GIT_AUTHOR_EMAIL=liugang@networking.io;
 GIT_AUTHOR_NAME="liuganggang";
 GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL;
 GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"; fi' -- --all