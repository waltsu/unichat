debug = require('debug')('uni:user-actor')
Bacon = require('baconjs')
_ = require('underscore')

bind = (socket, key) ->
  bus = new Bacon.Bus()
  socket.on key, (data) ->
    bus.push { socket: socket, key: key, data: data }
  bus

unbind = (socket, key) ->
  socket.removeAllListeners key

class UserActor
  constructor: (@manager, socket) ->
    @id = socket.id
    @type = 'player'

    bind(socket, 'join').onValue (ev) => @joinToRoom(ev)
    bind(socket, 'init').onValue (ev) => @initClient(ev)
    bind(socket, 'disconnect').onValue (ev) => @manager.removeUserActor(@id)
    bind(socket, 'send-message').onValue (ev) => @handleSendMessage(ev)

  joinToRoom: (ev) ->
    debug("Joing user #{@id} to room #{ev.data.room}")
    ev.socket.join(ev.data.room)
    @room = ev.data.room
    @nick = ev.data.nick
    unbind(ev.socket, 'join')
    @manager.globalBus.push { type: "BROADCAST", room: ev.data.room, key: "user-joined", data: {user:{ nick: ev.data.nick, id: @id } } }
    @manager.globalBus.push { type: "UNICAST", id: @id, room: ev.data.room, key: "init", data: { user: { nick: ev.data.nick, id: @id } } }

  handleSendMessage: (ev) ->
    debug("User #{@id} sent message #{ev.data.message}")
    @manager.globalBus.push { type: "BROADCAST", room: @room, key: "message", data: { user: { nick: @nick, id: @id }, message: ev.data.message } }

module.exports = UserActor
