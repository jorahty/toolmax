import 'package:flutter/material.dart';
import 'package:flame/game.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'canvas/canvas.dart';

void main() {
  final game = CanvasGame();

  final IO.Socket socket = IO.io(
    'http://localhost:3000',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );

  socket.onConnectError((msg) => print('connect error: $msg'));
  socket.on('move', game.onMove);

  runApp(GameWidget(game: game));
}
