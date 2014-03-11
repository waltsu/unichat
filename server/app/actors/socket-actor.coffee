debug = require('debug')('uni:socket-actor')
Bacon = require('baconjs')
_ = require('underscore')
WebSocketServer = require('ws').Server

send = (ws, jsonData) ->
  ws.send(JSON.stringify(jsonData))

class SocketActor
  constructor: (@manager) ->
    @type = 'socket'
    @sockets = []

    @bindEvents()

  bindEvents: ->
    @manager.globalBus.filter((ev) -> ev.type == 'START_LISTENING_SOCKETS').onValue (ev) => @startListeningSockets(ev.server)

  startListeningSockets: (server) ->
    debug('Start listening for socket connections')
    wss = new WebSocketServer {server: server}
    wss.on 'connection', (ws) ->
      debug("Got new connection: ", _.keys(ws))
      send(ws, { data: "hello world" })

module.exports = SocketActor
