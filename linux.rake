#常用命令
	cp -a file new_file
	cp -i file new_file

	rm -i /tmp/*.log

	touch ./-file

  tar -czvf emall.tar.gz emall.sql
  tar -xzvf emall.tar.gz

	basename work/meyer.zip        return meyer.zip
	dirname work/meyer.zip           return work

	head -n 30 production.log
	tail -n 30 production.log
	tail -n +100 production.log

	ls -l --time=atime production.log

	umask 022

	chattr -i file
	chattr -a file

	order_items = OrderItem.includes(:order).where("order_items.product_id = 105 AND orders.state >= 1 AND (order_items.created_at between '2013-05-20 00:00:00' AND '2013-05-31 23:59:59')")
  order_ids = order_items.map(&:order_id).uniq
  user_ids= Order.where(id: order_ids).map(&:user_id).uniq
  users = User.where(id: user_ids).where("user_source != 'nippon_member' or user_source is null").map(&:id).uniq
  counts = OrderItem.includes(:order).where("order_items.product_id = 105 AND orders.state >= 1 AND (order_items.created_at between '2013-05-20 00:00:00' AND '2013-05-31 23:59:59')").where("orders.user_id in (?)", users).sum(:quantity)

1.rvmsudo god quit; 2kill all resques; 3 rvmsudo god 4 load all resques

# tmux

 tmux list-sessions

 tmux new-session -s rails

 tmux a -t rails 恢复rails窗口

 tmux kill-session -t rails 杀死rails 窗口

 tmux kill-server


 c-b d 退出

#mouse:
  sudo modprobe -r psmouse

  sudo modprobe psmouse proto=imps

#github

  git log --pretty=oneline
  git log --patch
  git blame index.html

  git rebase -i HEAD~4
  git stash show --patch stash@{2}

  git config user.email admin@example.com
  git config --global alias.comt commit

  chmod -R 777 system/ 给system/以及所有于它关联的文件添加所有人可读可写的权限 777 1+2+4意思

  <%= sprintf("%.2f", @book.price) %>

  unzip -O CP936 xxx.zip

pstree -a

w
last
free -m



























