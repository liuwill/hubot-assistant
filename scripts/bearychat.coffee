weatherApi = require "../lib/weather"

module.exports = (robot) ->
  robot.hear /weather:(.+)/i, (res) ->
    city = res.match[1]
    url = weatherApi.buildQuery(city)

    robot.http(url).get() (err, response, body) ->
      data = JSON.parse body
      res.send weatherApi.filterWeatherText(data)

  robot.hear /hello/i, (res) ->
    res.send "hello world? 😃"

  robot.respond /咒语/i, (res) ->
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
