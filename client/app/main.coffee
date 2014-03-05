comments = require('./scripts/comments.coffee').comments

React.renderComponent comments(), document.getElementById('chat-container')
