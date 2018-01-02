# 2017-11-13
待测试： 讲师直播申请 权限控制

# 2017-11-16
Pub::Video.find_each {|x| x.copy_lecturer_poster!}

# 小米IP
119.57.108.112

# 首页
banner GET /tourists/banners
热门讲师 GET /lecturer_feeds/hot_lecturers
内容 GET /lecturer_feeds/welcome_v2

# 关注
讲师 /follow_v21
直播 POST /lecturer_feeds/follow_lecturer_v1

# 我的收藏
GET /users/collections
# 我的留言
GET /users/my_message_new
# 专属讲师
GET /orders/my_lecturer_list
# 投顾报告
GET /orders/my_invest_product

# 购买页面
lecturer_live_product_v2_1_1
# 风险评测 检测
GET /orders/buy_now
# 不评测 撤销下单
GET /orders/cancel_buy_modal
# 下单
pay_order_upchina

# 讲师个人页
get '/feeds_v2_1'

# BUG
1.详情页 免责声明，返回不了√
2. 首页下拉抖动
3. 问股 关注登录 返回页面 最后返回不了√
4. 登录注册XX清空输入√



cat development.log| grep --context=3 '/auth_callbacks/forward' | less

H5版二期任务：
(1)首页VIPtab 及VIP列表（加锁/解锁/立即开通）
(2)关注直播-VIP列表
(3)我的-尊享服务（剔除申请退款、申请调换讲师）
(4)风险承受能力测评（购买时逻辑+我的tab）
(5)图文直播详情页的加锁、解锁、VIP消息展示、开通VIP功能
(6)产品购买页
(7)购买成功提示页
(8)讲师个人主页增加VIP购买功能；





var mescroll0 = new MeScroll("mescroll0", {
        down: {
          auto: true, //是否在初始化完毕之后自动执行下拉回调callback; 默认true
          callback: downCallback0 //下拉刷新的回调
        },
        up: {
          auto: false, //是否在初始化时以上拉加载的方式自动加载第一页数据; 默认false
          callback: upCallback0, //上拉回调,此处可简写; 相当于 callback: function (page) { upCallback(page); }
          onScroll: scrollm,
          toTop:{ //配置回到顶部按钮
            src: "<%= image_url 'custom/pub/v1/mescroll-totop.png' %>" //默认滚动到1000px显示,可配置offset修改
          }
        }
      });

      function scrollm(mescroll, y, isUp){
        console.log(isUp)
        console.log(y)
        // 上滑
        if(isUp == true && window.scrollY < 131 && y < 131){
          window.scrollTo(0, y);
        }

        // 下滑
        if(isUp == false && window.scrollY > 130 && y == 0 ){
          window.scrollTo(0,0);
        }
      }

