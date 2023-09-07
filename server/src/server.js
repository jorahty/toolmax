const express = require('express');
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const port = 3000;

app.use(express.static('public'));

http.listen(port, () => console.log(`Listening on *:${port}`));

// broadcast movement at 60 Hz
setInterval(() => {
  io.volatile.emit('move', Math.random());
}, 1000 / 60);

// handle client connection
io.on('connect', (socket) => {
  console.log('connect!');

  socket.on('msg', () => {
    console.log('msg');
  });

  socket.on('disconnect', () => {
    console.log('disconnect!');
  });
});
