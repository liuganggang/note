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
