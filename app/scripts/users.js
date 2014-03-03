/**
* @jsx React.DOM
*/
var $ = require('jquery');
var users = React.createClass({
  render: function () {
    return (
      <div className="users">Hello Users</div>
    );
  }
});

React.renderComponent(
    <users />,
    $('#users-container').get(0)
)

