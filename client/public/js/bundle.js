(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
/** @jsx React.DOM */var commentForm, comments, commentsList, div, form, _ref;

_ref = React.DOM, div = _ref.div, form = _ref.form;

commentsList = React.createClass({displayName: 'commentsList',
  render: function() {
    return div({
      className: "comments-list"
    }, "");
  }
});

commentForm = React.createClass({displayName: 'commentForm',
  submit: function() {
    return console.log("submit");
  },
  render: function() {
    return form({
      className: "comment-form",
      onSubmit: this.submit
    }, div({}, "comment form"));
  }
});

comments = React.createClass({displayName: 'comments',
  getInitialState: function() {
    return {
      comments: []
    };
  },
  submit: function() {
    return console.log("submitting", arguments);
  },
  render: function() {
    return div({
      className: 'comments'
    }, commentsList({
      comments: this.state.comments
    }), commentForm({
      submit: this.submit
    }));
  }
});

React.renderComponent(comments(), document.getElementById('chat-container'));


},{}]},{},[1])
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlcyI6WyIvVXNlcnMvcGV0cmkvRG9jdW1lbnRzL0NvZGVzL3VuaWNoYXQvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsIi9Vc2Vycy9wZXRyaS9Eb2N1bWVudHMvQ29kZXMvdW5pY2hhdC9jbGllbnQvYXBwL21haW4uY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQUEsSUFBQSxvREFBQTs7QUFBQSxPQUFjLEtBQUssQ0FBQyxHQUFwQixFQUFDLFdBQUEsR0FBRCxFQUFNLFlBQUEsSUFBTixDQUFBOztBQUFBLFlBRUEsR0FBZSxLQUFLLENBQUMsV0FBTixDQUNiO0FBQUEsRUFBQSxNQUFBLEVBQVEsU0FBQSxHQUFBO1dBQ04sR0FBQSxDQUFJO0FBQUEsTUFBQSxTQUFBLEVBQVcsZUFBWDtLQUFKLEVBQWdDLEVBQWhDLEVBRE07RUFBQSxDQUFSO0NBRGEsQ0FGZixDQUFBOztBQUFBLFdBTUEsR0FBYyxLQUFLLENBQUMsV0FBTixDQUNaO0FBQUEsRUFBQSxNQUFBLEVBQVEsU0FBQSxHQUFBO1dBQ04sT0FBTyxDQUFDLEdBQVIsQ0FBWSxRQUFaLEVBRE07RUFBQSxDQUFSO0FBQUEsRUFFQSxNQUFBLEVBQVEsU0FBQSxHQUFBO1dBQ04sSUFBQSxDQUFLO0FBQUEsTUFBQSxTQUFBLEVBQVcsY0FBWDtBQUFBLE1BQTJCLFFBQUEsRUFBVSxJQUFDLENBQUEsTUFBdEM7S0FBTCxFQUNFLEdBQUEsQ0FBSSxFQUFKLEVBQVEsY0FBUixDQURGLEVBRE07RUFBQSxDQUZSO0NBRFksQ0FOZCxDQUFBOztBQUFBLFFBYUEsR0FBVyxLQUFLLENBQUMsV0FBTixDQUNUO0FBQUEsRUFBQSxlQUFBLEVBQWlCLFNBQUEsR0FBQTtXQUNmO0FBQUEsTUFBQyxRQUFBLEVBQVUsRUFBWDtNQURlO0VBQUEsQ0FBakI7QUFBQSxFQUVBLE1BQUEsRUFBUSxTQUFBLEdBQUE7V0FDTixPQUFPLENBQUMsR0FBUixDQUFZLFlBQVosRUFBMEIsU0FBMUIsRUFETTtFQUFBLENBRlI7QUFBQSxFQUlBLE1BQUEsRUFBUSxTQUFBLEdBQUE7V0FDTixHQUFBLENBQUk7QUFBQSxNQUFBLFNBQUEsRUFBVyxVQUFYO0tBQUosRUFDRSxZQUFBLENBQWE7QUFBQSxNQUFDLFFBQUEsRUFBVSxJQUFDLENBQUEsS0FBSyxDQUFDLFFBQWxCO0tBQWIsQ0FERixFQUVFLFdBQUEsQ0FBWTtBQUFBLE1BQUMsTUFBQSxFQUFRLElBQUMsQ0FBQSxNQUFWO0tBQVosQ0FGRixFQURNO0VBQUEsQ0FKUjtDQURTLENBYlgsQ0FBQTs7QUFBQSxLQXVCSyxDQUFDLGVBQU4sQ0FBc0IsUUFBQSxDQUFBLENBQXRCLEVBQWtDLFFBQVEsQ0FBQyxjQUFULENBQXdCLGdCQUF4QixDQUFsQyxDQXZCQSxDQUFBIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt0aHJvdyBuZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpfXZhciBmPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChmLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGYsZi5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCJ7ZGl2LCBmb3JtfSA9IFJlYWN0LkRPTVxuXG5jb21tZW50c0xpc3QgPSBSZWFjdC5jcmVhdGVDbGFzc1xuICByZW5kZXI6IC0+XG4gICAgZGl2IGNsYXNzTmFtZTogXCJjb21tZW50cy1saXN0XCIsIFwiXCJcblxuY29tbWVudEZvcm0gPSBSZWFjdC5jcmVhdGVDbGFzc1xuICBzdWJtaXQ6IC0+XG4gICAgY29uc29sZS5sb2cgXCJzdWJtaXRcIlxuICByZW5kZXI6IC0+XG4gICAgZm9ybSBjbGFzc05hbWU6IFwiY29tbWVudC1mb3JtXCIsIG9uU3VibWl0OiBAc3VibWl0LFxuICAgICAgZGl2IHt9LCBcImNvbW1lbnQgZm9ybVwiXG5cbmNvbW1lbnRzID0gUmVhY3QuY3JlYXRlQ2xhc3NcbiAgZ2V0SW5pdGlhbFN0YXRlOiAtPlxuICAgIHtjb21tZW50czogW119XG4gIHN1Ym1pdDogLT5cbiAgICBjb25zb2xlLmxvZyBcInN1Ym1pdHRpbmdcIiwgYXJndW1lbnRzXG4gIHJlbmRlcjogLT5cbiAgICBkaXYgY2xhc3NOYW1lOiAnY29tbWVudHMnLFxuICAgICAgY29tbWVudHNMaXN0IHtjb21tZW50czogQHN0YXRlLmNvbW1lbnRzfVxuICAgICAgY29tbWVudEZvcm0ge3N1Ym1pdDogQHN1Ym1pdH1cblxuUmVhY3QucmVuZGVyQ29tcG9uZW50IGNvbW1lbnRzKCksIGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdjaGF0LWNvbnRhaW5lcicpXG4iXX0=
