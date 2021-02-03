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



npm install --global yarn



https://developer.aliyun.com/mirror/NPM?from=tnpm


使用说明
你可以使用我们定制的 cnpm (gzip 压缩支持) 命令行工具代替默认的 npm:

$ npm install -g cnpm --registry=https://registry.npm.taobao.org
或者你直接通过添加 npm 参数 alias 一个新命令:

alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# Or alias it in .bashrc or .zshrc
$ echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc && source ~/.zshrc


npm install v8-profiler --profiler_binary_host_mirror=https://npm.taobao.org/mirrors/node-inspector/
npm install --canvas_binary_host_mirror=https://npm.taobao.org/mirrors/node-canvas-prebuilt/


npm root -g

npx node

npm list --depth=0

npm list canvas


console.log(JSON.stringify(obj, null, 2))



































