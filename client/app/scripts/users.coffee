{div} = React.DOM
{form, input, label} = React.DOM

roomForm = React.createClass
  submit: ->
    {room} = @refs
    roomNode = room.getDOMNode()
    if roomNode.value
      @props.joinMessage {room: room.state.value, nick: 'Peppe'}
    false

  render: ->
    form className: "credentials-form", onSubmit: @submit,
      label {}, "Huone",
        input className: "credentials-room", type: "text", ref: "room"
      input className: "credentials-send", type: "submit", value: "Send",

usersContainer = React.createClass
  getInitialState: ->
    {users: [], key: 0}

  joinMessage: (message) ->
    @props.socket.emit('join', message)

  render: ->
    div id: "users-container",
      roomForm({joinMessage: @joinMessage})

module.exports.usersContainer = usersContainer

