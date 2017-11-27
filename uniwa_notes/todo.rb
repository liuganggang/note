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

