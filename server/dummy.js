$(function() {
  var socket = io.connect('http://localhost:7000');
  $('#join').click(function(ev) {
    ev.preventDefault();
    socket.emit('join', {
      room: "foo"
    });
  });
  $('#send-message').click(function(ev) {
    ev.preventDefault();
    console.log("send message");
    socket.emit('send-message', {
      message: "Hello world"
    });
  });
  socket.on('user-joined', function (data) {
    console.log(data);
  });
});
