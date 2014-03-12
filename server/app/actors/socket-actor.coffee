debug = require('debug')('uni:socket-actor')
Bacon = require('baconjs')
_ = require('underscore')
WebSocketServer = require('ws').Server

class SocketActor
  constructor: (@manager) ->
    @type = 'socket'
    @sockets = []

    @bindEvents()

  bindEvents: ->
    @manager.globalBus.filter((ev) -> ev.type == 'START_LISTENING_SOCKETS').onValue (ev) => @startListeningSockets(ev.io)

  startListeningSockets: (io) ->
    debug('Start listening for socket connections')
    @io = io
    @io.sockets.on 'connection', @newConnection

  newConnection: (socket) =>
    debug("Got new connection! #{socket.id}")
    @sockets.push socket
    @manager.createUserActor(socket)

  joinToRoom: (ev) ->
    debug("User #{ev.socket.id} joined to room #{ev.data.room}")
    ev.socket.join(ev.data.room)

module.exports = SocketActor
