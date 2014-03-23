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

  createUserActor: (socket) ->
    debug('Creating new user actor')
    userActor = new UserActor(@, socket)
    @actors.push(userActor)

  removeUserActor: (id) ->
    debug("Removing user actor: #{id}")
    @actors = _.filter(@actors, (a) -> a.id != id)

  getUsersFromRoom: (room) ->
    _.chain(@actors).filter((a) -> a.type == 'user').filter((a) -> a.room == room).value()

actorManager = new ActorManager()
module.exports = actorManager
