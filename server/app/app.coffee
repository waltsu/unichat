express = require 'express'
debug = require('debug')('uni:main')

app = express()
http = require 'http'
server = http.createServer app

actorManager = require('./actors/actor-manager')

actorManager.globalBus.push({ type: 'START_LISTENING_SOCKETS' })

server.listen(process.env.PORT)
debug("Started Unichat backend: #{process.env.PORT}")
