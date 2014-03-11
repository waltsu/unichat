var socket = io.connect('http://localhost:7000');
socket.on('greeting', function (data) {
  console.log(data);
});
