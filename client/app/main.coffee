$                 = require('jquery')
socket            = require('socket.io-client').connect('http://localhost:7000')

messagesContainer = require('./scripts/messages.coffee').messagesContainer
usersContainer    = require('./scripts/users.coffee').usersContainer
nickRoomForm    = require('./scripts/nick-room-form.coffee').nickRoomForm

{div, h4}            = React.DOM
{input, form, label} = React.DOM

chatApp = React.createClass
  getInitialState: ->
    socket.on('init', @initialize)
    socket.on('user-joined', @userJoined)
    socket.on('message', @messageReceived)
    return {users: [], messages: []}

  handleCredentials: (credentials) ->
    console.log credentials
    @state.user = {}
    @setState {user: {id: null, nick: credentials.user.nick, room: credentials.room}}
    socket.emit('join', {nick: credentials.user.nick, room: credentials.room})
    React.unmountComponentAtNode(document.getElementById('modal-container'))

  componentDidMount: ->
    if not @props.user and not @props.room
      component = div className: "overlay",
          nickRoomForm room: @state.room, nick: @state.user, handleCredentials: @handleCredentials
      React.renderComponent component, document.getElementById("modal-container")

  initialize: (data) ->
    @setState {user: id: data.user.id, nick: @state.user.nick}

  userJoined: (data) ->
    @state.users.push data.user
    @setState {users: @state.users}

  messageReceived: (data) ->
    if data.user.id is @state.user.id then return
    @state.messages.push {text: data.message, user: data.user}
    @setState {messages: @state.messages}

  sendMessageHandle: (message) ->
    decorateMessage = (message) =>
      message.user =
        nick: @state.user.nick
      message
    @state.messages.push decorateMessage(message)
    socket.emit('send-message', {message: message.text})
    @setState {messages: @state.messages}

  render: ->
    div id: "main-container",
      messagesContainer messages: @state.messages, user: @state.user, onMessageSubmit: @sendMessageHandle
      usersContainer users: @state.users, room: @state.room

React.renderComponent chatApp(), document.getElementById('wrap')
