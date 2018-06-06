robot.respond /咒语/, (res) ->
  robot.emit 'bearychat.attachment',
    # required
    message: res.message
    # requried
    text: '随便来点什么试试...'
    attachments: [
      {
        color: '#cb3f20',
        text: '好雨知时节',
      },
      {
        text: '当春乃发生',
      },
      {
        images: [
          {url: 'http://techartisan.cn/static/images/site/qrcode_for_gh_f922927798f8_344.jpg'},
        ]
      }
    ]
