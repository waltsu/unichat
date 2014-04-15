debug = require('debug')('uni:user-actor')
Bacon = require('baconjs')
_ = require('underscore')

Message = require('../models/message')
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
    @type = 'user'

    bind(socket, 'join').onValue (ev) => @joinToRoom(ev)
    bind(socket, 'disconnect').onValue (ev) => @handleDisconnet(ev)
    bind(socket, 'send-message').onValue (ev) => @handleSendMessage(ev)

  joinToRoom: (ev) ->
    debug("Joing user #{@id} to room #{ev.data.room}")
    ev.socket.join(ev.data.room)
    @room = ev.data.room
    @nick = ev.data.nick
    unbind(ev.socket, 'join')

    Message.messagesByRoom(@room).map((results) ->
      _.map results, (r) -> _.omit(r.hash(), 'room')
    ).onValue (messages) =>
      roomUsers = _.map(@manager.getUsersFromRoom(@room), (u) -> _.pick(u, 'id', 'nick'))

      @manager.globalBus.push { type: "BROADCAST", room: ev.data.room, key: "user-joined", data: {user:{ nick: ev.data.nick, id: @id } } }
      @manager.globalBus.push({
        key: "init",
        type: "UNICAST",
        id: @id,
        room: ev.data.room,
        data: {
          user: {
            nick: ev.data.nick,
            id: @id
          },
          users: roomUsers
          old_messages: messages
        }
      })

  handleSendMessage: (ev) ->
    debug("User #{@id} sent message #{ev.data.message}")
    message =
      user:
        nick: @nick
        id: @id
      message: ev.data.message
    @_persistMessage(message)
    @manager.globalBus.push { type: "BROADCAST", room: @room, key: "message", data: message }

  handleDisconnet: (ev) ->
    @manager.removeUserActor(@id)
    debug("Broadcasting to others in room that user #{@id} has left the room")
    @manager.globalBus.push { type: "BROADCAST", room: @room, key: "user-left", data: { user: { nick: @nick, id: @id } } }

    if @manager.getUsersFromRoom(@room).length == 0
      @_turnOutLights()

  _persistMessage: (message) ->
    debug("Persisting message")
    message = Message.fromSentMessage(message, @room)
    message.save()

  _turnOutLights: ->
    return unless @room
    debug("User #{@nick} turns lights out from room #{@room}")
    Message.removeAllMessages(@room)

module.exports = UserActor
