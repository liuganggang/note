#Rails code
去掉描述的2边空格，并限制长度80以后的为省略号

	truncate(strip_tags(product.description),length: 80)

  link_to_function "退出全屏", "window.opener = null; window.close();"

  link_to "Back", :back  == javascript:history.back();

  delete 和 destroy 的区别:前者删除记录不会调用 ActiveRecord 中的回收函数和验证函数,而后 者会去调用。建议用 destroy。

  send_data(img, :type=>”image/jpeg”, :disposition=>”inline”)
  参数 1 可以指定一个文件名,参数 2 指定所传送的数据类型,参数 3 为 inline 显示数据或 attachment 下载并保存数据

  send_file 本方法和 send_data 类似,但它更适合大数据量的传输。

  除了有 send_data 的三个参数外,本方法 还有两个参数,:streaming=>true(边读边传,false 为读完文件到服务器内存再传给客户端),

  : buffer_size=>4096 数据缓冲区大小(一次传输的数据量,4096 字节是默认值)

  arr = []

  arr<<"f"<<2 #增加元素"f";再增加元素 2

  arr.insert(3,"d") #在 3 号索引位置插入元素"d"

  p arr1 | arr2 # ["a", 4, 5, "b", 1, 3, 2]
  求两数组的并集 p arr1 & arr2 #[4, 5]  求两数组的交集

  createtime.strftime("%Y-%m-%d %H:%M:%S")

  -2.abs #绝对值


#scoped转化array为relation,这样就可以使用分页方法了，array不能使用分页
	Model.scoped.order('created_at DESC').page(params[:page]).per(28)

#浏览数自动递增
	Model.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?

#参数加密
URI的使用 require 'URI'

  href="/asd?order=<%= URI.escape('最热')%>" #=> 已经加密 审查元素看不到

  href="/asd?order=最热">最热                  #=> 未加密 审查元素可见

#Request 的用法

  request.remote_ip  直接获取 地址的IP

#搜寻数据:

  grep "Started GET \"/landing" production.log > /tmp/landing.log

  truncate(product.description.gsub(/<.*?>/,''),:length => 80)


#require load include diffarent
1、requre,load用于文件，如.rb等等结尾的文件。

2、include则用于包含一个文件(.rb等结尾的文件)中的模块。

3、requre一般情况下用于加载库文件，而load则用于加载配置文件。

4、requre加载一次，load可加载多次。



areas = Rails.cache.fetch('api_get_areas', expires_in: 1.months) do
  Area.all.as_json(methods: :parent_id, except: [:code,:published,:remark])
end
