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


# ab test
ab -C 'raffle=22' -m 'PATCH' -H 'Accept:text/javascript' url

ab -C 'user_a=22' -m 'PATCH' -H 'Accept:text/javascript' url

ab -n 1000 -c 100 -m 'PATCH' -H 'Accept:text/javascript' url

ab -m 'POST' -H 'Accept:text/html' url

ab -C 'raffle=22' -m 'POST' -H 'Accept:text/html' url

ab -H 'Accept:text/html' url

ab -H 'Accept:text/html' url

ab -m 'PATCH' -H 'Accept:text/javascript' url

ab -m 'PATCH' -H 'Accept:text/javascript' url

ab -H 'Accept:text/html' url

ab -H 'Accept:text/html' url

