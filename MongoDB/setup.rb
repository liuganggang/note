mongo

show dbs


mongodump -h 127.0.0.1 -o /home/zhangy/mongodb/
mongodump -h 192.168.1.108 -d tank -o /home/zhangy/mongodb/

mongorestore /home/zhangy/mongodb/  #这里的路径是所有库的备份路径

mongorestore -d tank /home/zhangy/mongodb/tank/  #tank这个数据库的备份路径
  
mongorestore -d tank_new /home/zhangy/mongodb/tank/  #将tank还有tank_new数据库中