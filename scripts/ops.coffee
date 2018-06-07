shelljs = require "shelljs"

module.exports = (robot) ->
  robot.hear /pwd/i, (res) ->
    res.send process.cwd()

  robot.respond /cpu/i, (res) ->
    res.reply shelljs.exec('vmstat 1 1').stdout

