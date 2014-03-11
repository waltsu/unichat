debug = require('debug')('uni:socket-actor')
Bacon = require('baconjs')
_ = require('underscore')

class SocketActor
  constructor: (@manager) ->
    @type = 'socket'
    @sockets = []

    @bindEvents()

  bindEvents: ->
    @manager.globalBus.filter((ev) -> ev.type == 'START_LISTENING_SOCKETS').onValue => @startListeningSockets()

  startListeningSockets: ->
    debug('Start listening for socket connections')

module.exports = SocketActor
