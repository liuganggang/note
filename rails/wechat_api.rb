
message = {
  touser: openid,
  msgtype: "miniprogrampage",
  miniprogrampage: {
    title: "Hello title",
    appid: appid,
    pagepath: 'pages/new',
    thumb_media_id: thumb_media_id
  }
}


items = [
  { thumb_media_id: Wechat.api(:account).media_create('image', 'ali.png')["media_id"],
    author: 'author',
    title: 'title',
    content_source_url: 'https://www.baidu.com/',
    content: File.read("index.html"),
    digest: "digest",
    show_cover_pic: 0 }
]
result = Wechat.api.media_uploadnews(Wechat::Message.new(MsgType: 'mpnews').mpnews(items))
Wechat.api.message_mass_preview(Wechat::Message.to(openid).ref_mpnews(result["media_id"]))

# 临时素材
Wechat.api(:account).media_create('image', 'ali.png')["media_id"]
# 永久素材
Wechat.api(:account).material_add("image", "ali.png")

