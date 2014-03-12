$(function() {
  var socket = io.connect('http://localhost:7000');
  $('#join').click(function(ev) {
    ev.preventDefault();
    socket.emit('join', {
      room: "foo",
      nick: new Date().getTime()
    });
  });
  $('#send-message').click(function(ev) {
    ev.preventDefault();
    console.log("send message");
    socket.emit('send-message', {
      message: "Hello world"
    });
  });
  socket.on('message', function (data) {
    $("body").append("<div>" + data.message + "</div>");
    console.log(data);
  });
});
