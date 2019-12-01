#!/usr/bin/env ruby

# psql数据库备份
sql_file=/opt/db_backup/db_production-$(date "+%Y_%m_%d_%H_%M_%S").sql
# mysqldump -u root -p123456 --all-databases > $sql_file
pg_dump --username=postgres --dbname=db_production --host=localhost > $sql_file
zip ${sql_file}.zip $sql_file
/bin/rm $sql_file
