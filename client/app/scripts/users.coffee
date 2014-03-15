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
  handleRoomContentEditable: () ->
    node = @refs.roomName.getDOMNode()
    node.textContent = ""
    node.contentEditable = true
    node.focus()

  changeRoom: (ev) ->
    if ev.keyCode isnt 13 then return
    node = @refs.roomName.getDOMNode()
    node.contentEditable = false
    node.blur()

  render: ->
    header className: "users-header",
      div {},
        span {className: "room-name", ref: "roomName", onBlur: @changeRoom, onKeyDown: @changeRoom}, @props.room
        i className: "fa fa-times", onClick: @handleRoomContentEditable

usersContainer = React.createClass
  render: ->
    div id: "users-container",
      usersHeader {room: @props.room}
      # roomForm {joinMessage: @joinMessage}

module.exports.usersContainer = usersContainer

