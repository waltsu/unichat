{div, span, header, i} = React.DOM
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

usersHeader = React.createClass
  render: ->
    header className: "users-header",
      div {},
        span className: "room-name", @props.room
        i className: "fa fa-times"

usersContainer = React.createClass
  render: ->
    div id: "users-container",
      usersHeader {room: @props.room}
      # roomForm {joinMessage: @joinMessage}

module.exports.usersContainer = usersContainer

