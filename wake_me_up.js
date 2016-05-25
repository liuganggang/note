

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
