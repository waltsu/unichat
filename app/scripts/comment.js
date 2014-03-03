/**
* @jsx React.DOM
*/
var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="comment"></div>
    );
  }
});
React.renderComponent(
  <CommentBox />,
  document.getElementById('chat-container')
);

