
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
