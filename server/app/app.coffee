process.env.NODE_ENV ||= "development"

express = require('express')
debug = require('debug')('uni:main')
http = require('http')
socketio = require('socket.io')

app = express()
server = http.createServer(app)
io = socketio.listen server, { log: false }

require('./routes')(app)

actorManager = require('./actors/actor-manager')

actorManager.globalBus.push({ type: 'START_LISTENING_SOCKETS', io: io })

server.listen(process.env.PORT)
debug("Started Unichat backend: #{process.env.PORT}")
