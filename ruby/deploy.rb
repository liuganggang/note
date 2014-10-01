#apache2
apache2启动方式

	sudo apache2ctl graceful
	sudo apache2ctl start
	sudo apache2ctl stop
	sudo apache2ctl restart

	service apache2 reload

	sudo service httpd restart

	a2ensite和a2dissite
	/etc/init.d/apache2 reload

	ln -s /usr/local/nginx/sbin/nginx /usr/sbin/ #创建 nginx到/usr/sbin目录下

	redis-server /usr/local/etc/redis.conf > /dev/null &       #后台启动

	export RAILS_ENV=production
	#can set production env as default.

#ubuntu

 解决GBK编码压缩包在linux下解压乱码问题
	env LANG=GBK 7za x -olande "1-r2  1.31.zip"
	find . -exec convmv -f GBK -t utf8 --notest {} \;

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
