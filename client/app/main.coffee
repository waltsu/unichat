{div, h4} = React.DOM
{input, form, label} = React.DOM
$ = require('jquery')
socket = require('socket.io-client').connect('http://localhost:7000')
comments = require('./scripts/comments.coffee').comments

credentialsForm = React.createClass
  submit: ->
    {room, nick} = @refs
    roomNode = room.getDOMNode()
    nickNode = nick.getDOMNode()
    if roomNode.value and nickNode.value
      socket.emit('join', {room: room.state.value, nick: nick.state.value})
    false

  render: ->
    form className: "credentials-form", onSubmit: @submit,
      label {}, "Nimimerkki",
        input className: "credentials-nick", type: "text", ref: "nick"
      label {}, "Huone",
        input className: "credentials-room", type: "text", ref: "room"
      input className: "credentials-send", type: "submit", value: "Send",

mainPrompt = React.createClass
  render: ->
    div className: 'main-prompt',
      credentialsForm {submit: @submit}

React.renderComponent mainPrompt(), document.getElementById('main-container')
React.renderComponent comments({url: 'resources/dummy.json', name: 'Peppe'}), document.getElementById('chat-container')
