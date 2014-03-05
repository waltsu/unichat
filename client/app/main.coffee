{div, form} = React.DOM

commentsList = React.createClass
  render: ->
    div className: "comments-list", ""

commentForm = React.createClass
  submit: ->
    console.log "submit"
  render: ->
    form className: "comment-form", onSubmit: @submit,
      div {}, "comment form"

comments = React.createClass
  getInitialState: ->
    {comments: []}
  submit: ->
    console.log "submitting", arguments
  render: ->
    div className: 'comments',
      commentsList {comments: @state.comments}
      commentForm {submit: @submit}

React.renderComponent comments(), document.getElementById('chat-container')
