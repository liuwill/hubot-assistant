module.exports = (robot) ->
  robot.catchAll (res) ->
    reg = new RegExp "^\@#{robot.name}","i"
    match = reg.test(res.message.text)
    if match
      res.send "I'm #{robot.name}. Sorry My Master,I do not know what you are saying"
    res.finish()
