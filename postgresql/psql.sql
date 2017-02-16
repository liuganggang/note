#\l
# 切换数据库
# \c qatime_dev
# \dt 查看表
# \d 查看表结构
# \di 查看索引

\c dbname username serverIP port

psql -U liugang -d exampledb -h 127.0.0.1 -p 5432

psql -U liugang -d qatime_dev

# 设置密码
\password postgres

# 创建数据库用户 密码
CREATE USER liugang WITH PASSWORD 'password';

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



