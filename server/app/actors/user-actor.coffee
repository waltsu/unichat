debug = require('debug')('uni:user-actor')

class UserActor
  constructor: (@manager, @id) ->
    @type = 'player'


  bindEvents: ->
    @unsubscribeChatMessage = @manager.globalBus.filter((ev) => ev.id == @id).filter((ev) -> ev.type == 'CHAT_MESSAGE').onValue (ev) => @handleChatMessage(ev)

  handleChatMessage: (ev) ->
    debug("Got chat message: #{ev.message}")

module.exports = UserActor
