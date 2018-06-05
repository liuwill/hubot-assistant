config = require "../package.json"
shelljs = require "shelljs"

module.exports = (robot) =>
  robot.hear /time/i, (res) ->
    res.send (new Date()).toISOString()

  robot.respond /version/i, (res) ->
    res.reply config.version

  robot.hear /docker/i, (res) ->
    res.emote "something will happen"

  robot.hear /date/i, (res) ->
    res.reply shelljs.exec('cal', {silent:true}).stdout
