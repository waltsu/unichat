var host = location.origin.replace(/^http/, 'ws')
console.log(host);
var ws = new WebSocket("ws://localhost:7000");
ws.onmessage = function (event) {
  console.log(JSON.parse(event.data));
};
