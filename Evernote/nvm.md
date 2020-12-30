nvm ls
nvm ls-remote

nvm current

nvm install v15.2.0

nvm install node && nvm alias default node

nvm alias default v15.2.0

原因
由于某些你懂的因素，导致GitHub的raw.githubusercontent.com域名解析被污染了。

查询真实IP
在https://www.ipaddress.com/查询raw.githubusercontent.com的真实IP。

通过修改hosts解决此问题
199.232.96.133 raw.githubusercontent.com
