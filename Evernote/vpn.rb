
sudo apt-get install python-pip
pip install shadowsocks


sudo /home/ubuntu/.local/bin/ssserver -c /etc/shadowsocks.json -d start


{
   "server":"0.0.0.0",
   "server_port":8848,
   "local_address": "127.0.0.1",
   "local_port":1080,
   "password":"mypassword",
    "timeout":300,
   "method":"aes-256-cfb",
   "fast_open": false
 }


