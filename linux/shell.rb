echo ${LANG}

unset LANG

echo ${LIU}${GANG}        => LIU GANG

${LIU:-value}             => if LIU not set,use value (value not set)

${LIU:=value}             => value set

${variable:+value}        => return "" if variable.null

readonly LIU

who | wc -l

#批量杀死进程号 awk 搜索第二个
kill -9 `ps aux |grep sync_ladp_users|awk '{print $2}'`

# 单个文件上传
curl -X POST http://localhost:8080/upload \
  -F "file=@/Users/appleboy/test.zip" \
  -H "Content-Type: multipart/form-data"

# 多个文件上传
curl -X POST http://localhost:8080/upload \
  -F "upload[]=@/Users/appleboy/test1.zip" \
  -F "upload[]=@/Users/appleboy/test2.zip" \
  -H "Content-Type: multipart/form-data"

curl -v -X POST \
  http://localhost:8080/loginJSON \
  -H 'content-type: application/json' \
  -d '{ "user": "manu" }'

curl -X POST -v --form name=user --form "avatar=@./avatar.png" http://localhost:8080/profile
