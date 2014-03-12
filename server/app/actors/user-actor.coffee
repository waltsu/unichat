debug = require('debug')('uni:user-actor')
Bacon = require('baconjs')

bind = (socket, key) ->
  bus = new Bacon.Bus()
  socket.on key, (data) ->
    bus.push { socket: socket, key: key, data: data }
  bus

class UserActor
  constructor: (@manager, socket) ->
    @type = 'player'

    bind(socket, 'join').onValue (ev) => @joinToRoom(ev)

  handleChatMessage: (ev) ->
    debug("Got chat message: #{ev.message}")

  joinToRoom: (ev) ->
    debug("Joing user #{@id} to room #{ev.data.room}")
    ev.socket.join(ev.data.room)


module.exports = UserActor
