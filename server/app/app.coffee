process.env.NODE_ENV ||= "development"

express = require('express')
debug = require('debug')('uni:main')
http = require('http')

app = express()
server = http.createServer(app)

require('./routes')(app)

actorManager = require('./actors/actor-manager')

actorManager.globalBus.push({ type: 'START_LISTENING_SOCKETS', server: server })

server.listen(process.env.PORT)
debug("Started Unichat backend: #{process.env.PORT}")
