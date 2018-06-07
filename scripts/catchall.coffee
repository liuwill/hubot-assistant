module.exports = (robot) ->
  robot.catchAll (res) ->
    reg = new RegExp "^\s*[@]?#{robot.name}[:,]?\s*","i"
    match = reg.test(res.message.text)
    if match
      res.send "I'm #{robot.name}. Sorry My Master,I do not know what you are saying"
    res.finish()

  robot.respond /meta/i, (res) ->
    res.send "#{robot.name}:#{robot.alias}"
    res.finish()
