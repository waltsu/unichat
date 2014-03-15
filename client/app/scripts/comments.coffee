_ = require 'underscore'

{div, h4} = React.DOM
{ul, li} = React.DOM
{form, input} = React.DOM

comment = React.createClass
  render: ->
    li className: 'comment',
      div className: 'comment-name left',
        @props.name
      div className: 'comment-content',
        @props.text


commentsList = React.createClass
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
    nodes = @props.comments.map (c) ->
      comment(c)
    ul className: "comments-list", nodes


commentForm = React.createClass
  submit: ->
    {text} = @refs
    textNode = text.getDOMNode()
    if textNode.value
      @props.submit {text: text.state.value}
      textNode.value = ""
    false

  render: ->
    form className: "comment-form", onSubmit: @submit,
      input className: "comment-submit rigth", type: "submit", value: "Send",
      input className: "comment-input left", type: "text", placeholder: "Chat...", ref: "text"


comments = React.createClass
  loadComments: ->
    $.ajax(
      url: @props.url
      dataType: 'json'
      success: (comments) =>
        @setState {comments: comments, key: comments.length}
      error: -> console.error "error"
    )

  getInitialState: ->
    {comments: [], key: 0}

  componentWillMount: ->

  decorateComment: (comment, key) ->
    comment.name = @props.name
    comment.key = key
    return comment

  submit: (comment) ->
    comments = @state.comments
    key = @state.key + 1
    comments.push(@decorateComment(comment, key))
    @setState {comments: comments, key: key}

  render: ->
    div className: 'comments',
      commentsList {comments: @state.comments}
      commentForm {submit: @submit}

module.exports.comments = comments
