debug = require('debug')('uni:socket-actor')
Bacon = require('baconjs')
_ = require('underscore')

class SocketActor
  constructor: (@manager) ->
    @type = 'socket'
    @sockets = []

    @bindEvents()

  bindEvents: ->
    @manager.globalBus.filter((ev) -> ev.type == 'START_LISTENING_SOCKETS').onValue (ev) => @startListeningSockets(ev.io)
    @manager.globalBus.filter((ev) -> ev.type == 'BROADCAST').onValue (ev) => @broadcast(ev)
    @manager.globalBus.filter((ev) -> ev.type == 'UNICAST').onValue (ev) => @unicast(ev)


  startListeningSockets: (io) ->
    debug('Start listening for socket connections')
    @io = io
    @io.sockets.on 'connection', @newConnection

  broadcast: (ev) ->
    debug("Broadcasting to all clients in room: #{ev.room}")
    room = ev.room
    data = ev.data
    @io.sockets.in(room).emit(ev.key, data)

  unicast: (ev) ->
    debug("Unicasting to single client in room: #{ev.room}")
    room = ev.room
    data = ev.data
    id = ev.id
    @io.sockets.in(room).socket(id).emit(ev.key, data)

  newConnection: (socket) =>
    debug("Got new connection! #{socket.id}")
    @sockets.push socket
    @manager.createUserActor(socket)

module.exports = SocketActor
