str = str.force_encoding('GBK').encode('UTF-8')
str = str.encode('UTF-8')

当str.encoding == 'ASCII-8BIT'时，
ruby并不知道这个str的编码。
我用其他编辑器得知它的编码是GBK，所以我先强制将它标记为GBK，再转为UTF-8, 就成功了。