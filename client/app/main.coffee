{div, h4} = React.DOM
{input, form, label} = React.DOM
$ = require('jquery')
socket = require('socket.io-client').connect('http://localhost:7000')
messagesContainer = require('./scripts/messages.coffee').messagesContainer
usersContainer = require('./scripts/users.coffee').usersContainer

chatApp = React.createClass
  getInitialState: ->
    socket.on('init', @initialize)
    socket.on('user-joined', @userJoined)
    socket.on('message', @messageReceived)
    socket.emit('join', {room: 'ImaIIA', nick: 'Petri'})
    return {users: [], messages: []}

  initialize: (data) ->
    @setState {user: data.user}

  userJoined: (data) ->
    @state.users.push data.user
    @setState {users: @state.users}

  messageReceived: (data) ->
    if data.user.id is @state.user.id then return
    @state.messages.push {text: data.message, user: data.user}
    @setState {messages: @state.messages}

  sendMessageHandle: (message) ->
    decorateMessage = (message) =>
      message.user = @state.user || 'Petri'
      message
    @state.messages.push decorateMessage(message)
    socket.emit('send-message', {message: message.text})
    @setState {messages: @state.messages}

  render: ->
    div id: "main-container",
      messagesContainer messages: @state.messages, user: @state.user, onMessageSubmit: @sendMessageHandle
      usersContainer users: @state.users

React.renderComponent chatApp(), document.getElementById('wrap')
