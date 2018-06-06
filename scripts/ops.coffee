shelljs = require "shelljs"

module.exports = (robot) ->
  robot.hear /pwd/i, (res) ->
    res.send process.cwd()
