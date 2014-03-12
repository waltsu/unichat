debug = require('debug')('uni:user-actor')
Bacon = require('baconjs')

bind = (socket, key) ->
  bus = new Bacon.Bus()
  socket.on key, (data) ->
    bus.push { socket: socket, key: key, data: data }
  bus

class UserActor
  constructor: (@manager, socket) ->
    @id = socket.id
    @type = 'player'

    bind(socket, 'join').onValue (ev) => @joinToRoom(ev)
    bind(socket, 'disconnect').onValue (ev) => @manager.removeUserActor(@id)

  handleChatMessage: (ev) ->
    debug("Got chat message: #{ev.message}")

  joinToRoom: (ev) ->
    debug("Joing user #{@id} to room #{ev.data.room}")
    ev.socket.join(ev.data.room)


module.exports = UserActor
