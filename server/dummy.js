$(function() {
  var socket = io.connect('http://localhost:7000');
  $('#button').click(function(ev) {
    ev.preventDefault();
    socket.emit('join', {
      room: "foo"
    });
  });
  socket.on('user-joined', function (data) {
    console.log(data);
  });
});
