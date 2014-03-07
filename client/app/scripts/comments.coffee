{div, h4} = React.DOM
{ul, li} = React.DOM
{form, input} = React.DOM

comment = React.createClass
  render: ->
    li className: 'comment',
      div className: 'comment-name',
        @props.name
      div className: 'comment-content',
        @props.text

commentsList = React.createClass
  componentWillUpdate: ->
    node = @getDOMNode()
    @canScroll = node.scrollTop + node.offsetHeight is node.scrollHeight

  componentDidUpdate: ->
    if @canScroll
      node = @getDOMNode()
      node.scrollTop = node.scrollHeight

  render: ->
    nodes = @props.comments.map (c) ->
      comment(c)
    ul className: "comments-list", nodes

commentForm = React.createClass
  submit: ->
    {text} = @refs
    @props.submit {text: text.state.value}
    text.getDOMNode().value = ""
    false

  render: ->
    form className: "comment-form", onSubmit: @submit,
      input className: "comment-submit rigth", type: "submit", value: "Post",
      input className: "comment-input left", type: "text", placeholder: "Chat...", ref: "text"

comments = React.createClass
  loadComments: ->
    $.ajax(
      url: @props.url
      dataType: 'json'
      success: (comments) =>
        @setState {comments: comments}
      error: -> console.error "error"
    )

  getInitialState: ->
    {comments: []}

  componentWillMount: ->
    @loadComments()

  submit: (comment) ->
    comments = @state.comments
    comment.name = @props.name
    comments.push(comment)
    @setState {comments: comments}

  render: ->
    div className: 'comments',
      commentsList {comments: @state.comments}
      commentForm {submit: @submit}

module.exports.comments = comments
