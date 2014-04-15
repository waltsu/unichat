orm = require 'orm'
debug = require('debug')('uni:models:message')
Bacon = require('baconjs')
_ = require('underscore')

DB_STRING = process.env.DB_STRING
debug("Using #{DB_STRING} as a DB_STRING")

connect = (cb) ->
  orm.connect "#{DB_STRING}?debug=true", cb

class Message
  @dbModel = (db) ->
    db.define "message", {
      nick: type: "text"
      message: type: "text"
      room: type: "text"
    }, {
      methods: {
        hash: ->
          {
            nick: @nick
            message: @message
            room: @room
          }
      }
    }

  @fromSentMessage: (message, room) ->
    new Message(message.user.nick, message.message, room)

  @messagesByRoom: (room) ->
    returnBus = new Bacon.Bus()
    connect (err, db) ->
      if err then return debug("DB ERR #{err}")
      Message.dbModel(db).find room: room, (err, results) ->
        if err
          returnBus.error(err)
        else
          returnBus.push results
        returnBus.end()
    returnBus

  # Hit 'n run method for removing all messages from the specified room.
  # It is not the world greatest problem if the messages couldn't be removed
  @removeAllMessages: (room) ->
    Message.messagesByRoom(room).flatMap((messages) ->
      Bacon.fromArray(messages)
    ).onValue('.remove')

  constructor: (@nick, @message, @room) ->

  hash: ->
    {
      nick: @nick
      message: @message
      room: @room
    }

  # Hit 'n run method for saving messages. It is not world greatest problem if we can't store it
  save: ->
    debug "Saving"
    connect (err, db) =>
      if err then return debug("DB ERR #{err}")
      debug("Got database!")
      Message.dbModel(db).create @hash(), (err, result) ->
        if err then return debug("Insertion error: #{err}")

module.exports = Message
