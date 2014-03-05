{div, form, h4} = React.DOM

comment = React.createClass
  render: ->
    div className: 'comment',
      h4 className: 'comment-author',
        @props.user
      div className: 'comment-content',
        @props.text

commentsList = React.createClass
  render: ->
    nodes = @props.comments.map (c) ->
      {user, text} = c
      comment({user: user, text: text})
    div className: "comments-list", nodes

commentForm = React.createClass
  submit: ->
    console.log "submit"
  render: ->
    form className: "comment-form", onSubmit: @submit,
      div {}, "comment form"

comments = React.createClass
  getInitialState: ->
    {comments: [
      {user: "Minetsku", text: "very good!"}
      {user: "Petsku", text: "nice!"}
    ]}
  submit: ->
    console.log "submitting", arguments
  render: ->
    div className: 'comments',
      commentsList {comments: @state.comments}
      commentForm {submit: @submit}

module.exports.comments = comments
