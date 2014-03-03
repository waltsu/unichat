users/**
* @jsx React.DOM
*/
var $ = require('jquery');
var comments = React.createClass({
  render: function () {
    return (
      <div className="comments">Hello comments</div>
    );
  }
});

React.renderComponent(
    <comments />,
    $('#chat-container').get(0)
)
