_ = require 'underscore'

{div, h4} = React.DOM
{ul, li} = React.DOM
{form, input} = React.DOM

message = React.createClass
  render: ->
    li className: 'message',
      div className: 'message-name left',
        @props.user.nick
      div className: 'message-content',
        @props.text

messagesList = React.createClass
  componentWillUpdate: ->
    isScrollAtBottom = _.partial((node) ->
      node.scrollTop + node.offsetHeight is node.scrollHeight
    , @getDOMNode())

    @canScroll = isScrollAtBottom()

  componentDidUpdate: ->
    scrollToBottom = _.partial((node) ->
      node.scrollTop = node.scrollHeight
    , @getDOMNode())

    if @canScroll then scrollToBottom()

  render: ->
    nodes = @props.messages.map (c) ->
      message(c)
    ul className: "messages-list", nodes


messageForm = React.createClass
  submit: ->
    {text} = @refs
    textNode = text.getDOMNode()
    if textNode.value
      @props.handleSubmit {text: text.state.value}
      textNode.value = ""
    false

  render: ->
    form className: "message-form", onSubmit: @submit,
      input className: "message-submit rigth", type: "submit", value: "Send",
      input className: "message-input left", type: "text", placeholder: "Chat...", ref: "text"


messagesContainer = React.createClass
  render: ->
    div id: "chat-container",
      div className: 'messages',
        messagesList {messages: @props.messages}
        messageForm {handleSubmit: @props.onMessageSubmit}

module.exports.messagesContainer = messagesContainer
