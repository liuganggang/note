SELECT * FROM users LEFT JOIN (activity_ones) ON (activity_ones.user_id=users.id) where activity_ones.created_at between '2013-03-18 00:00:00'and '2013-03-19 23:59:59' group by user_id

SELECT * FROM activity_ones LEFT OUTER JOIN (users) ON (users.id=activity_ones.user_id) where activity_ones.created_at between '2013-03-18 00:00:00'and '2013-03-19 23:59:59' group by activity_ones.user_id

SELECT *,authentications.name as '用户名',apply_experiments.created_at as '参加活动时间' FROM apply_experiments LEFT OUTER JOIN (users,authentications) ON (users.id=apply_experiments.user_id and authentications.user_id=apply_experiments.user_id) where apply_experiments.created_at between '2013-03-26 00:00:00'and '2013-03-26 23:59:59' group by apply_experiments.user_id


select * from users where users.id in (select activity_ones.user_id from activity_ones group by activity_ones.user_id) union (select angel_wings.user_id from angel_wings group by angel_wings.user_id) union (select apply_experiments.user_id from apply_experiments group by apply_experiments.user_id) group by users.id


select count(*) from users where users.id in (select distinct activity_ones.user_id from activity_ones where created_at between '2013-03-20 00:00:00'and '2013-03-20 23:59:59') union (select distinct angel_wings.user_id from angel_wings where created_at between '2013-03-20 00:00:00'and '2013-03-20 23:59:59') union (select distinct apply_experiments.user_id from apply_experiments where created_at between '2013-03-20 00:00:00'and '2013-03-20 23:59:59') group by users.id


select count(*) from users where users.id in (select distinct activity_ones.user_id from activity_ones where created_at between '2013-03-28 00:00:00'and '2013-03-28 23:59:59') or users.id in (select distinct angel_wings.user_id from angel_wings where created_at between '2013-03-28 00:00:00'and '2013-03-28 23:59:59') or users.id in (select distinct apply_experiments.user_id from apply_experiments where created_at between '2013-03-28 00:00:00'and '2013-03-28 23:59:59')

SELECT `order_items`.product_id, sum(quantity) as total FROM `order_items`, `orders`, `users`
WHERE `orders`.`id` = `order_items`.`order_id`
AND `orders`.`user_id` = `users`.`id`
AND ((users.user_source != 'nippon_member' or users.user_source is null) AND orders.state >= 1 AND order_items.created_at between '2013-05-01 00:00:00' AND '2013-05-31 23:59:59') group by product_id ORDER BY total desc limit 10


select (select username from users where id = user_id), SUM(total_price) as sum_total from orders where state IN (1,2,3) and created_at between '2013-10-11 15:33:00' AND '2013-10-31 16:00:00' group by user_id order by sum_total desc limit 8


#SQL
    select prod_id, prod_name from products where prod_name like 'jet%'; %代表任意以jet开头的名字,之后任意字符,不限字数

    select prod_id, prod_name from products where prod_name like '%jet%';

    select prod_id, prod_name from products where prod_name like 's%e'; %无法匹配 null

    select prod_id, prod_name from products where prod_name like '_ doc type'; _ 匹配单个字符

    select prod_id, prod_name from products where prod_name like '% doc type';

    select prod_name from products where prod_name regexp  '.et'; 告诉mysql regexp后的东西是正则表达式

    select Concat(prod_name, ' (', prod_price, ')') from products order by prod_id; prod_name 和 prod_price 串接起来

    select Concat(Trim(prod_name), ' (', Trim(prod_price), ')') from products order by prod_id; RTrim 去掉两边空格 LTrim RTrim 左边或右边

    select Concat(Trim(prod_name), ' (', Trim(prod_price), ')') as vend_title from products order by prod_id;

    select prod_id, prod_price, prod_total, prod_price * prod_total as prod_num from products order by prod_id;

    select prod_id, prod_name from products where data(prod_data) = '2005-09-01';

    select prod_id, prod_name from products where DATA(prod_data) between '2005-09-01' and '2005-09-30';

    select prod_id, prod_name from products where year(prod_data) = 2005 and month(prod_data) = 01;

    select avg(prod_price) as avg_prod_price from products; 计算平均值

    select avg(distinct prod_price) as avg_prod_price from products; 计算不同价格之间的平均值

    select count(*) as num_rows from customers; select count(prod_emall) as num_rows from customers; 计算行数

    select max(prod_price) as max_price from customers; 计算最大价格

    select min(prod_price) as min_price from customers; 计算最小价格

    select sum(prod_price) as sum_price from customers; 计算和

    select count(*) as num_rows, avg(prod_price) as avg_prod_price, max(prod_price) as max_price from products; 组合聚集函数查询

    select vend_id, count(*) as num_rows from products group by vend_id; 按vend_id分组查询行数 group by 只能用在 where 后 order by 前.

    select vend_id, count(*) as num_rows from products group by vend_id having count(*) >= 2; 过滤count大于等于2的vend_id

    select prod_name, prod_price from products where prod_price = 2.25 union select prod_name, prod_price from products where prod_price in (1,100);  union 组合2个查询,返回1个输出结果集

    select prod_name, prod_price from products where prod_price = 2.25 union all select prod_name, prod_price from products where prod_price in (1,100); 返回所有结果,包括重复的

    使用 union  时,order by 只能放在最后1个查询里, 不能逐个查询.

    update customers
      set cust_emall = '123@123.com'
      where cust_id = 1005;

    update customers
      set cust_emall = '123@123.com'
          cust_name  = 'liugang'
      where cust_id  = 1005;

    update rgnore customers
      set cust_emall = '123@123.com'
          cust_name  = 'liugang'
      where cust_id = 1005;   使用 rgnore 可以是更新多个数据时,如果出现错误,仍然继续更新,不会全部恢复为更新前的数据.

    如果需要删除某列的值 只需要将该列的值 update 为 null 就可以

    delete from customers where cust_id = 1005;

    truncate table 删除表 并且重建表,如果需要删除所有列,可使用,不必使用 delete 逐个删除 ,速度更快

    select last_insert_id() 返回最后1个 auto_increment 值.

    drop table customers;

    rename table customers2 to customers
                 customers3 to customers
                 customers4 to customers;  多个表重命名.

    alter database DATABASE_NAME charset=utf8;

    set names utf8; （先确认编码 注意不是UTF-8）