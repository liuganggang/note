

//open http://www.w3school.com.cn/index.html
// copy it in console
// keep your eyes safe.

function get_away_form_display() {
  if(confirm('起来走动啦!!!!!!!\n不要看电脑!!!!!\n迟早要瞎!!\n 每小时提醒一次, 确定继续定时提醒么?')){
    return false;
  }else{
    window.open("about:blank","_self").close();
  }
}
setInterval("get_away_form_display();", 3600000);

//lol

var Sys = {};
var ua = navigator.userAgent.toLowerCase();
var louie=false;
if (window.ActiveXObject){
  Sys.ie = ua.match(/msie ([\d.]+)/)[1]
  if (Sys.ie<=8){
    louie=true;
  //alert('你目前的IE版本为'+Sys.ie+'版本太低，请升级！');
  }
}
    var audio = null,
    core ={
      //控制背景音乐播放
      audioControl:function(){
        if(!louie){
          if(audio.paused){
            audio.play();
            document.getElementById("Jm").textContent = '静音';
            document.getElementById("Jm").className = 'audio-control audio-yes';
            pgvSendClick({hottag:'act.a20160429urf.audio.play'})
          }else{
            audio.pause();
            document.getElementById("Jm").textContent = '播放';
            document.getElementById("Jm").className = 'audio-control audio-no';
            pgvSendClick({hottag:'act.a20160429urf.audio.stop'})
          }
        }else{
          alert('您目前的IE版本为'+Sys.ie+'版本，暂不提供音乐播放！');
        }
      }
    };


  //是否支持audio并插入audio
  if(document.createElement("audio").canPlayType){
    audio = document.createElement("audio");
    audio.src = "http://ossweb-img.qq.com/images/lol/act/a20160429urf/urf2015music.mp3";
    audio.autoplay = 'autoplay';
    audio.loop = 'loop';
    $('#Jm').show();
    pgvSendClick({hottag:'act.a20160429urf.support.audio'})
  }
  //检测是否是否支持H5 video
  if(!!document.createElement('video').canPlayType)
  {
    pgvSendClick({hottag:'act.a20160429urf.support.video'})
    //创建video元素
    var vidTest=document.createElement("video");
    //检测是否可以播放webm格式的视频
    webmTest=vidTest.canPlayType('video/webm; codecs="vp8.0, vorbis"');
    if (webmTest!="probably")
    {
      document.getElementById("nb-video").style.display="none";
      pgvSendClick({hottag:'act.a20160429urf.webm.no'});
      //检测是否可以播放mp4格式的视频
      if(vidTest.canPlayType('video/mp4; codecs="avc1.4D401E, mp4a.40.2"') == "probably"){
        pgvSendClick({hottag:'act.a20160429urf.mp4.yes'})
      }
    }else{
      pgvSendClick({hottag:'act.a20160429urf.webm.yes'})
    }
  }

  $('#J_play').on('click',function(){
    if(!louie){
    if(!audio.paused){
      audio.pause();
      document.getElementById("Jm").textContent = '播放';
      document.getElementById("Jm").className = 'audio-control audio-no';
    }}
    var video = new tvp.VideoInfo();
    video.setVid("a0196tr626t");
    var player =new tvp.Player();
    player.create({
      width:934,
      height:569,
      video:video,
      modId:"J_video",
      autoplay:true,
      vodFlashSkin:'http://imgcache.qq.com/minivideo_v1/vd/res/skins/TencentPlayerMiniSkin.swf'
    });
  });

  need("biz.dialog",function(showDialog){
    var _hide = showDialog.hide;
    showDialog.hide = function(o) {
      if(o)return;
      _hide.call(this);
    };
  });

  function TGDialogS(e) {
    need("biz.dialog-min", function(Dialog) {
        Dialog.show({
            id: e,
            bgcolor: '#000',
            opacity: 50
        });
    });
  }

  function closeDialog() {
      need("biz.dialog-min", function(Dialog) {
          Dialog.hide();
      });
  }

  $(function() {
      TGDialogS('pop');
      $('.pop-close').click(function() {
        closeDialog()
        $('.pop-sy').show();
      });
      $('.pop-sy').click(function() {
        TGDialogS('pop');
          $('.pop-sy').hide();
      })
  })


//  milo.addEvent(g("dologin"), "click", function() {
//      need("biz.login-min",function(LoginManager){
//        LoginManager.init({
//          needReloadPage:true
//        });
//        LoginManager.login();
//      });
//      return false;
//    });
//    milo.addEvent(g("dologout"), "click", function() {
//      need("biz.login-min",function(LoginManager){
//        LoginManager.logout();
//      });
//      return false;
//    });
//  milo.ready(function() {
//    need("biz.login-min",function(LoginManager){
//      LoginManager.checkLogin(function(){
//          g("login_qq_span").innerHTML = LoginManager.getUserUin();//获取QQ号
//            amsInit(50582, 262091);//调用，查询是否已经绑定
//        }
//      );
//    });
//  });


//loadScript('js/index.js?_r=' + new Date().getTime());

if (typeof (pgvMain) == 'function') pgvMain();