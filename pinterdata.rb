1. 安装中文分词插件 https://github.com/medcl/elasticsearch-analysis-ik
        1. 安装插件
            1. 进入es的安装路径下的plugins目录下， /usr/share/elasticsearch/plugins创建ik文件夹
            2. 下载对应版本的插件
            3. 解压到ik文件夹中
            4. 重启ES
        2. 配置自定义停止词和分词
            1. 直接定义
            2. 动态定义（热更新）
                1. 打开ik文件下的IKAnalyzer.cfg.xml文件
<!--用户可以在这里配置远程扩展字典 -->
<entry key="remote_ext_dict">location</entry>
<!--用户可以在这里配置远程扩展停止词字典-->
<entry key="remote_ext_stopwords">location</entry>
                2. 可以将需自动更新的热词放在一个 UTF-8 编码的 .txt 文件里，放在 nginx 或其他简易 http server 下，当 .txt 文件修改时，http server 会在客户端请求该文件时自动返回相应的 Last-Modified 和 ETag
                3. 6.8.6版本有bug，出现叠词时评分出现问题，更换成6.6.1版本，详情见https://github.com/medcl/elasticsearch-analysis-ik/issues/680




                http://localhost:9200/category/_analyze?analyzer=ansj_index&text=测试用例