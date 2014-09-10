    select prod_id, prod_name from products where prod_name like '_ doc type'; _ 匹配单个字符

    select prod_name from products where prod_name regexp  '.et'; 告诉mysql regexp后的东西是正则表达式

    select Concat(prod_name, ' (', prod_price, ')') from products order by prod_id; prod_name 和 prod_price 串接起来

    select Concat(Trim(prod_name), ' (', Trim(prod_price), ')') from products order by prod_id; RTrim 去掉两边空格 LTrim RTrim 左边或右边

    select Concat(Trim(prod_name), ' (', Trim(prod_price), ')') as vend_title from products order by prod_id;

    select prod_id, prod_name from products where data(prod_data) = '2005-09-01';

    select prod_id, prod_name from products where DATA(prod_data) between '2005-09-01' and '2005-09-30';

    select avg(prod_price) as avg_prod_price from products; 计算平均值

    select avg(distinct prod_price) as avg_prod_price from products; 计算不同价格之间的平均值

    select count(*) as num_rows from customers; select count(prod_emall) as num_rows from customers; 计算行数

    select max(prod_price) as max_price from customers; 计算最大价格

    select min(prod_price) as min_price from customers; 计算最小价格

    select vend_id, count(*) as num_rows from products group by vend_id having count(*) >= 2; 过滤count大于等于2的vend_id

    select prod_name, prod_price from products where prod_price = 2.25 union select prod_name, prod_price from products where prod_price in (1,100);  union 组合2个查询,返回1个输出结果集

    select prod_name, prod_price from products where prod_price = 2.25 union all select prod_name, prod_price from products where prod_price in (1,100); 返回所有结果,包括重复的

    使用 union  时,order by 只能放在最后1个查询里, 不能逐个查询.

    update rgnore customers
      set cust_emall = '123@123.com'
          cust_name  = 'liugang'
      where cust_id = 1005;   使用 rgnore 可以是更新多个数据时,如果出现错误,仍然继续更新,不会全部恢复为更新前的数据.

    rename table customers2 to customers
                 customers3 to customers
                 customers4 to customers;  多个表重命名.

    SELECT po.OrderID, p.LastName, p.FirstName
    FROM Persons AS p, Product_Orders AS po
    WHERE p.LastName='Adams' AND p.FirstName='John'

    SELECT Persons.LastName,Orders.OrderNo
    INTO Persons_Order_Backup
    FROM Persons
    INNER JOIN Orders
    ON Persons.Id_P=Orders.Id_P

    aa = Design.find_by_sql("select new_designs.id, new_designs.title, new_designs.user_id, max(new_designs.id) as max_id from (select * from designs order by id desc) as new_designs inner join users on users.id = new_designs.user_id group by new_designs.user_id order by new_designs.id desc").map(&:id)[0..100]

    select GROUP_CONCAT(distinct id order by "id desc" SEPARATOR '-') from designs group by user_id

    SELECT * FROM table  LIMIT [offset,] rows | rows OFFSET offset


















