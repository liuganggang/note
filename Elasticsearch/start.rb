curl -X GET 'http://localhost:9200/_cat/health?v'

curl -X GET 'http://localhost:9200/_cat/indices?v'

curl -X GET 'http://localhost:9200/_cat/nodes?v'

curl -X GET 'http://localhost:9200/_cat/plugins?v'

http://localhost:9200/_mapping?pretty=true

curl -X PUT 'localhost:9200/weather'

curl -X DELETE 'localhost:9200/weather'


curl -X GET 'https://search-lifanli-ecs-1-is7rn3k4v3o7oytolkgepf42m4.ap-northeast-1.es.amazonaws.com/_cat/indices?v'


bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.4.2/elasticsearch-analysis-ik-6.4.2.zip

curl -X PUT 'localhost:9200/accounts' -H 'Content-Type:application/json' -d '
{
  "mappings": {
    "person": {
      "properties": {
        "user": {
          "type": "text",
          "analyzer": "ik_max_word",
          "search_analyzer": "ik_max_word"
        },
        "title": {
          "type": "text",
          "analyzer": "ik_max_word",
          "search_analyzer": "ik_max_word"
        },
        "desc": {
          "type": "text",
          "analyzer": "ik_max_word",
          "search_analyzer": "ik_max_word"
        }
      }
    }
  }
}'

curl -X PUT 'localhost:9200/accounts/person/1' -H 'Content-Type:application/json' -d '
{
  "user": "张三",
  "title": "工程师",
  "desc": "数据库管理"
}'

curl -X POST 'localhost:9200/accounts/person' -H 'Content-Type:application/json' -d '
{
  "user": "李四",
  "title": "工程师",
  "desc": "系统管理"
}'

curl 'localhost:9200/accounts/person/1?pretty=true'

curl -X DELETE 'localhost:9200/accounts/person/1'

curl -X PUT 'localhost:9200/accounts/person/1' -H 'Content-Type:application/json' -d '
{
    "user" : "张三",
    "title" : "工程师",
    "desc" : "数据库管理，软件开发"
}'

curl 'localhost:9200/accounts/person/_search'

curl 'localhost:9200/accounts/person/_search' -H 'Content-Type:application/json' -d '
{
  "query" : { "match" : { "desc" : "软件" }},
  "from": 0,
  "size": 10
}'

curl 'localhost:9200/accounts/person/_search' -H 'Content-Type:application/json' -d '
{
  "query" : { "match" : { "desc" : "软件 系统" }},
  "from": 0,
  "size": 10
}'

curl 'localhost:9200/accounts/person/_search' -H 'Content-Type:application/json' -d '
{
  "query" : {
    "bool" : {
      "must" : [
        { "match" : { "desc" : "软件" } },
        { "match" : { "desc" : "数据" } }
      ]
    }
   },
  "from": 0,
  "size": 10
}'


# 插件安装
elasticsearch-plugin list











