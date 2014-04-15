orm = require 'orm'

console.log "SETTING UP DATABASE"
DB_STRING = process.env.DB_STRING

console.log "USING DATABASE STRING #{DB_STRING}"

orm.connect "#{DB_STRING}?debug=true", (err, db) ->
  if err then return console.log "DB ERR: #{err}"

  console.log "Create message table"
  Message = require('./models/message')
  Message.dbModel(db).sync (err) ->
    if err then return console.log err

    console.log "All models created successfully"
    process.exit()

