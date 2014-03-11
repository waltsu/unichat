root = (req, res) ->
  res.send "Use websockets!"

module.exports = (app) ->
  app.get '/', root
