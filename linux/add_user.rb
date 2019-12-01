操作过程：
# 1 root权限下
useradd /home/xiaoli xiaoli
# 2
passwd xiaoli

# 3
cd /home  && mkdir xiaoli

# 4
chown xiaoli xiaoli/

# 5 切到xiaoli的角色
su xiaoli

# 6
cd /home/xiaoli
# then
mkdir .ssh
# then
cd .ssh
# then
vi authorized_keys
# 写入ssh public key 后
chmod 600 authorized_keys

# 7
su root
#then
 vi /etc/ssh/sshd_config

# 写入

AllowUsers xiaoli

# 保存
/usr/sbin/sshd -T
#没错后
service sshd restart

注意：
1. 所有操作执行后必须验证能登录后才关闭原有窗口
2. sshd_config文件中已写入：
PermitRootLogin no
PasswordAuthentication yes

表示无法使用root登录并使用密码登录，只能通过ssh key访问
常用命令：
查看 所有用户：
cat /etc/passwd
查看登录情况
lastlog
