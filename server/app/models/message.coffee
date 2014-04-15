orm = require 'orm'
debug = require('debug')('uni:models:message')

DB_STRING = process.env.DB_STRING
debug("Using #{DB_STRING} as a DB_STRING")

class Message
  @dbModel = (db) ->
    db.define "message", {
      nick: type: "text"
      message: type: "text"
      room: type: "text"
    }

  @fromSentMessage: (message, room) ->
    new Message(message.user.nick, message.message, room)

  initialize: (@nick, @message, @room) ->

  hash: ->
    {
      nick: @nick
      message: @message
      room: @room
    }
  save: ->
    debug "Saving"
    orm.connect "#{DB_STRING}?debug=true", (err, db) =>
      if err then return debug("DB ERR #{err}")
      debug("Got database!")
      dbModel(db).sync()
###
      dbModel(db).create @hash(), (err, result) ->
        if err then return debug("Insertion error: #{err}")
        debug("Save succeeded")
        console.log result
###
module.exports = Message
