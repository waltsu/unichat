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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlcyI6WyIvVXNlcnMvcGV0cmkvRG9jdW1lbnRzL0NvZGVzL3VuaWNoYXQvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsIi9Vc2Vycy9wZXRyaS9Eb2N1bWVudHMvQ29kZXMvdW5pY2hhdC9hcHAvbWFpbi5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUNBQSxJQUFBLG9EQUFBOztBQUFBLE9BQWMsS0FBSyxDQUFDLEdBQXBCLEVBQUMsV0FBQSxHQUFELEVBQU0sWUFBQSxJQUFOLENBQUE7O0FBQUEsWUFFQSxHQUFlLEtBQUssQ0FBQyxXQUFOLENBQ2I7QUFBQSxFQUFBLE1BQUEsRUFBUSxTQUFBLEdBQUE7V0FDTixHQUFBLENBQUk7QUFBQSxNQUFBLFNBQUEsRUFBVyxlQUFYO0tBQUosRUFBZ0MsRUFBaEMsRUFETTtFQUFBLENBQVI7Q0FEYSxDQUZmLENBQUE7O0FBQUEsV0FNQSxHQUFjLEtBQUssQ0FBQyxXQUFOLENBQ1o7QUFBQSxFQUFBLE1BQUEsRUFBUSxTQUFBLEdBQUE7V0FDTixPQUFPLENBQUMsR0FBUixDQUFZLFFBQVosRUFETTtFQUFBLENBQVI7QUFBQSxFQUVBLE1BQUEsRUFBUSxTQUFBLEdBQUE7V0FDTixJQUFBLENBQUs7QUFBQSxNQUFBLFNBQUEsRUFBVyxjQUFYO0FBQUEsTUFBMkIsUUFBQSxFQUFVLElBQUMsQ0FBQSxNQUF0QztLQUFMLEVBQ0UsR0FBQSxDQUFJLEVBQUosRUFBUSxjQUFSLENBREYsRUFETTtFQUFBLENBRlI7Q0FEWSxDQU5kLENBQUE7O0FBQUEsUUFhQSxHQUFXLEtBQUssQ0FBQyxXQUFOLENBQ1Q7QUFBQSxFQUFBLGVBQUEsRUFBaUIsU0FBQSxHQUFBO1dBQ2Y7QUFBQSxNQUFDLFFBQUEsRUFBVSxFQUFYO01BRGU7RUFBQSxDQUFqQjtBQUFBLEVBRUEsTUFBQSxFQUFRLFNBQUEsR0FBQTtXQUNOLE9BQU8sQ0FBQyxHQUFSLENBQVksWUFBWixFQUEwQixTQUExQixFQURNO0VBQUEsQ0FGUjtBQUFBLEVBSUEsTUFBQSxFQUFRLFNBQUEsR0FBQTtXQUNOLEdBQUEsQ0FBSTtBQUFBLE1BQUEsU0FBQSxFQUFXLFVBQVg7S0FBSixFQUNFLFlBQUEsQ0FBYTtBQUFBLE1BQUMsUUFBQSxFQUFVLElBQUMsQ0FBQSxLQUFLLENBQUMsUUFBbEI7S0FBYixDQURGLEVBRUUsV0FBQSxDQUFZO0FBQUEsTUFBQyxNQUFBLEVBQVEsSUFBQyxDQUFBLE1BQVY7S0FBWixDQUZGLEVBRE07RUFBQSxDQUpSO0NBRFMsQ0FiWCxDQUFBOztBQUFBLEtBdUJLLENBQUMsZUFBTixDQUFzQixRQUFBLENBQUEsQ0FBdEIsRUFBa0MsUUFBUSxDQUFDLGNBQVQsQ0FBd0IsZ0JBQXhCLENBQWxDLENBdkJBLENBQUEiLCJzb3VyY2VzQ29udGVudCI6WyIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3Rocm93IG5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIil9dmFyIGY9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGYuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sZixmLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSIsIntkaXYsIGZvcm19ID0gUmVhY3QuRE9NXG5cbmNvbW1lbnRzTGlzdCA9IFJlYWN0LmNyZWF0ZUNsYXNzXG4gIHJlbmRlcjogLT5cbiAgICBkaXYgY2xhc3NOYW1lOiBcImNvbW1lbnRzLWxpc3RcIiwgXCJcIlxuXG5jb21tZW50Rm9ybSA9IFJlYWN0LmNyZWF0ZUNsYXNzXG4gIHN1Ym1pdDogLT5cbiAgICBjb25zb2xlLmxvZyBcInN1Ym1pdFwiXG4gIHJlbmRlcjogLT5cbiAgICBmb3JtIGNsYXNzTmFtZTogXCJjb21tZW50LWZvcm1cIiwgb25TdWJtaXQ6IEBzdWJtaXQsXG4gICAgICBkaXYge30sIFwiY29tbWVudCBmb3JtXCJcblxuY29tbWVudHMgPSBSZWFjdC5jcmVhdGVDbGFzc1xuICBnZXRJbml0aWFsU3RhdGU6IC0+XG4gICAge2NvbW1lbnRzOiBbXX1cbiAgc3VibWl0OiAtPlxuICAgIGNvbnNvbGUubG9nIFwic3VibWl0dGluZ1wiLCBhcmd1bWVudHNcbiAgcmVuZGVyOiAtPlxuICAgIGRpdiBjbGFzc05hbWU6ICdjb21tZW50cycsXG4gICAgICBjb21tZW50c0xpc3Qge2NvbW1lbnRzOiBAc3RhdGUuY29tbWVudHN9XG4gICAgICBjb21tZW50Rm9ybSB7c3VibWl0OiBAc3VibWl0fVxuXG5SZWFjdC5yZW5kZXJDb21wb25lbnQgY29tbWVudHMoKSwgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ2NoYXQtY29udGFpbmVyJylcbiJdfQ==
