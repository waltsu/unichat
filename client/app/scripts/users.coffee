{div, span, header, i} = React.DOM
{form, input, label} = React.DOM
{ul, li} = React.DOM

user = React.createClass
  render: ->
    li className: 'user',
      div className: 'user-name',
        @props.nick

usersList = React.createClass
  render: ->
    users = @props.users.map (u) ->
      user(u)
    ul className: "users-list", users

usersHeader = React.createClass
  changeRoom: (ev) ->
    if ev.keyCode isnt 13 then return
    node = @refs.roomName.getDOMNode()
    node.contentEditable = false
    node.blur()

  render: ->
    header className: "users-header",
      div {},
        span {className: "room-name", ref: "roomName", onBlur: @changeRoom, onKeyDown: @changeRoom}, @props.room

usersContainer = React.createClass
  render: ->
    div id: "users-container",
      usersHeader {room: @props.room}
      usersList {users: @props.users}

module.exports.usersContainer = usersContainer
