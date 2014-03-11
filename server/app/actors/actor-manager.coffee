debug = require('debug')('uni:actor-manager')
Bacon = require('baconjs')

SocketActor = require('./socket-actor')

class ActorManager
  constructor: ->
    @actors = []
    @globalBus = new Bacon.Bus()

    @createSocketActor()

  createSocketActor: ->
    debug('Creating socket actor')
    socketActor = new SocketActor(@)
    @actors.push(socketActor)

actorManager = new ActorManager()
module.exports = actorManager
