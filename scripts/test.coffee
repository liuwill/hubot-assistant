config = require "../package.json"

module.exports = (robot) =>
  robot.hear /when/i, (res) ->
    res.send (new Date()).toISOString()

  robot.respond /version/i, (res) ->
    res.reply config.version

  robot.hear /docker/i, (res) ->
    res.emote "something will happen"
