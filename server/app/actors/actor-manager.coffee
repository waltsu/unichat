debug = require('debug')('uni:actor-manager')
Bacon = require('baconjs')
_ = require('underscore')

SocketActor = require('./socket-actor')
UserActor = require('./user-actor')

class ActorManager
  constructor: ->
    @actors = []
    @globalBus = new Bacon.Bus()

    @createSocketActor()

  createSocketActor: ->
    debug('Creating socket actor')
    socketActor = new SocketActor(@)
    @actors.push(socketActor)

  createUserActor: (id) ->
    debug('Creating new user actor')
    userActor = new UserActor(id)
    @actors.push(userActor)

  removeUserActor: (id) ->
    debug("Removing user actor: #{id}")
    @actors = _.filter(@actors, (a) -> a.id != id)

actorManager = new ActorManager()
module.exports = actorManager
