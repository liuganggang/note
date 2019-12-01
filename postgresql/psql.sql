
\l
\c qatime_dev
\d 查看表结构
\dt 查看表
\du
\di 查看索引

SELECT version();

\c dbname username serverIP port

psql -U liugang -d exampledb -h 127.0.0.1 -p 5432

psql -U liugang -d qatime_dev

# 设置密码
\password postgres

# 创建数据库用户 密码
CREATE USER liugang WITH PASSWORD 'password';

CREATE USER qatime WITH CREATEDB;

# 创建用户数据库，这里为exampledb，并指定所有者为。
CREATE DATABASE exampledb OWNER liugang;

# 将exampledb数据库的所有权限都赋予liugang，否则dbuser只能登录控制台，没有任何数据库操作权限
GRANT ALL PRIVILEGES ON DATABASE exampledb to liugang;

# sql数据恢复
psql exampledb < exampledb.sql

\h：查看SQL命令的解释，比如\h select。
\?：查看psql命令列表。
\l：列出所有数据库。
\c [database_name]：连接其他数据库。
\d：列出当前数据库的所有表格。\d+
\d [table_name]：列出某一张表格的结构。
\du：列出所有用户。
\e：打开文本编辑器。
\conninfo：列出当前数据库和连接的信息。


# 基本操作
# 创建新表
CREATE TABLE user_tbl(name VARCHAR(20), signup_date DATE);
# 插入数据
INSERT INTO user_tbl(name, signup_date) VALUES('张三', '2013-12-22');
# 选择记录
SELECT * FROM user_tbl;
# 更新数据
UPDATE user_tbl set name = '李四' WHERE name = '张三';
# 删除记录
DELETE FROM user_tbl WHERE name = '李四' ;
# 添加栏位
ALTER TABLE user_tbl ADD email VARCHAR(40);
# 更新结构
ALTER TABLE user_tbl ALTER COLUMN signup_date SET NOT NULL;
# 更名栏位
ALTER TABLE user_tbl RENAME COLUMN signup_date TO signup;
# 删除栏位
ALTER TABLE user_tbl DROP COLUMN email;
# 表格更名
ALTER TABLE user_tbl RENAME TO backup_tbl;
# 删除表格
DROP TABLE IF EXISTS backup_tbl;


#备份数据库
可以使用pg_dump和pg_dumpall来完成。比如备份sales数据库：
pg_dump sales>/home/tk/pgsql/backup/1.bak
pg_dump dbname | gzip > filename.gz

#注：pg_dump可以对针对单表或者多表进行备份
如：pg_dump databasename -t tablename1 -t tablename2 > filename

数据库的备份
pg_dump -U liugang databasename -f /tmp/databasename.sql

数据库的恢复
psql -U liugang -d databasename -f /tmp/databasename.sql


# 中间表查询使用次数频繁.直接创建view来查询
# 创建view
CREATE VIEW myview AS
    SELECT city, temp_lo, temp_hi, prcp, date, location
        FROM weather, cities
        WHERE city = name;

SELECT * FROM myview;

DROP VIEW myview;



# psql 10.5

createdb liugang

dropdb liugang

psql liugang


# psql 11

$ createdb lifanli

$ dropdb lifanli

$ psql lifanli

SELECT version();

SELECT current_date;

SELECT 2 + 2 AS counter;

CREATE TABLE weather (
    city            varchar(80),
    temp_lo         int,           -- low temperature
    temp_hi         int,           -- high temperature
    prcp            real,          -- precipitation
    date            date
);

CREATE TABLE cities (
    name            varchar(80),
    location        point
);

DROP TABLE tablename;

INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');


INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
    VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');

INSERT INTO weather (date, city, temp_hi, temp_lo)
    VALUES ('1994-11-29', 'Hayward', 54, 37);

COPY weather FROM '/home/user/weather.txt';

SELECT * FROM weather;

SELECT city, (temp_hi+temp_lo)/2 AS temp_avg, date FROM weather;

SELECT * FROM weather
    WHERE city = 'San Francisco' AND prcp > 0.0;

SELECT * FROM weather
    ORDER BY city;

SELECT DISTINCT city
    FROM weather
    ORDER BY city;

SELECT *
    FROM weather INNER JOIN cities ON (weather.city = cities.name);

SELECT W1.city, W1.temp_lo AS low, W1.temp_hi AS high,
    W2.city, W2.temp_lo AS low, W2.temp_hi AS high
    FROM weather W1, weather W2
    WHERE W1.temp_lo < W2.temp_lo
    AND W1.temp_hi > W2.temp_hi;

SELECT max(temp_lo) FROM weather;

SELECT city FROM weather
    WHERE temp_lo = (SELECT max(temp_lo) FROM weather);

SELECT city, max(temp_lo)
    FROM weather
    GROUP BY city
    HAVING max(temp_lo) < 40;

UPDATE weather
    SET temp_hi = temp_hi - 2,  temp_lo = temp_lo - 2
    WHERE date > '1994-11-28';

DELETE FROM weather WHERE city = 'Hayward';

# 删除所有rows
DELETE FROM tablename;

# transactions
BEGIN;
UPDATE accounts SET balance = balance - 100.00
    WHERE name = 'Alice';
-- etc etc
COMMIT;


# 排名
SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;

SELECT depname, empno, salary,
       rank() OVER (PARTITION BY depname ORDER BY salary DESC)
FROM empsalary;


CREATE TABLE cities (
  name       text,
  population real,
  altitude   int     -- (in ft)
);

CREATE TABLE capitals (
  state      char(2)
) INHERITS (cities);

SELECT name, altitude
  FROM cities
  WHERE altitude > 500;

SELECT name, altitude
    FROM ONLY cities
    WHERE altitude > 500;














