comments = require('./scripts/comments.coffee').comments

React.renderComponent comments({url: 'resources/dummy.json', name: 'Peppe'}), document.getElementById('chat-container')
