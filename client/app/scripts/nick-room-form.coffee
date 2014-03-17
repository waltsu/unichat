{div, h2, br} = React.DOM
{form, input, label} = React.DOM

nickRoomForm = React.createClass
  handleSubmit: ->
    {nick, room} = @refs
    nickNode = nick.getDOMNode()
    roomNode = room.getDOMNode()
    if nickNode.value and roomNode.value
      @props.handleCredentials {user: {nick: nickNode.value}, room: roomNode.value}
    return false

  render: ->
    div className: "modal",
      form className: "nick-room-form", onSubmit: @handleSubmit,
        label className: "form-label", htmlFor: "nick", "Nimimerkki"
        input type: "text", id: "nick", ref: "nick"
        label className: "form-label", htmlFor: "room", "Huone"
        input type: "text", id: "room", ref: "room"
        input type: "submit", value: "Joinaa", className: "nick-room-submit"

module.exports.nickRoomForm = nickRoomForm
