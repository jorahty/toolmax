const logSocket = require('./util/logSocket');
const Matter = require('matter-js');
const express = require('express');
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const port = 3000;

app.use(express.static('public'));

http.listen(port, () => console.log(`Listening on *:${port}`));

// module aliases
const Engine = Matter.Engine,
  Events = Matter.Events,
  Runner = Matter.Runner,
  Body = Matter.Body,
  Bodies = Matter.Bodies,
  Common = Matter.Common,
  Vertices = Matter.Vertices,
  Composite = Matter.Composite;

// provide concave decomposition support library
Common.setDecomp(require('poly-decomp'));

// setup engine and world
const engine = Engine.create();
engine.gravity.scale *= 0.6;
const runner = Runner.create();
Runner.run(runner, engine);

// create bodies
const vertexString =
  '1740 997 1595 1142 442 1142 297 997 297 841 118 841 118 605 297 605 297 165 1008 165 1008 1 1 1 1 1377 2008 1377 2008 1 1028 1 1028 165 1740 165 1740 605 1918 605 1918 841 1740 841';
const arena = Bodies.fromVertices(0, 0, Vertices.fromPath(vertexString), {
  isStatic: true,
  friction: 0.01,
});
const leftPlayer = Bodies.rectangle(-200, 0, 40, 80, {
  restitution: 0.5,
  friction: 0.02,
});
const rightPlayer = Bodies.rectangle(200, 0, 40, 80, {
  restitution: 0.5,
  friction: 0.02,
});
const ball = Bodies.circle(-180, -100, 40, { restitution: 0.8, mass: 0.3 });

// add bodies to world
Composite.add(engine.world, [arena, leftPlayer, rightPlayer, ball]);

// broadcast movement
setInterval(() => {
  io.volatile.emit(
    'move',
    [
      leftPlayer.position.x,
      leftPlayer.position.y,
      leftPlayer.angle,
      rightPlayer.position.x,
      rightPlayer.position.y,
      rightPlayer.angle,
      ball.position.x,
      ball.position.y,
      ball.angle,
    ].map((n) => Math.round(n * 100) / 100)
  );
}, 1000 / 60);

// handle client connection
io.on('connect', (socket) => {
  logSocket(socket);

  socket.on('msg', () => {
    console.log('msg');
  });

  socket.on('disconnect', () => {
    logSocket(socket);
  });
});
