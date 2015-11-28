#使用 putty .ppk 密钥 转化ssh 登录

brew install putty

puttygen privatekey.ppk -O private-openssh -o privatekey.pem

chmod 700 privatekey.pem

ssh -i privatekey.pem user@my.server.com