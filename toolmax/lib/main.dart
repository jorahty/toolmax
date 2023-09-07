import 'package:flutter/material.dart';
import 'package:flame/game.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'canvas/canvas.dart';
import 'controls/controls.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CanvasGame _game;
  late IO.Socket _socket;

  @override
  void initState() {
    super.initState();

    _game = CanvasGame();

    _socket = IO.io(
      'http://localhost:3000',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    _socket.onConnect((_) => print('connect'));
    _socket.onConnectError((msg) => print('connect error: $msg'));
    _socket.onError((msg) => print('error: $msg'));

    _socket.on('move', _game.onMove);
  }

  @override
  void dispose() {
    _socket.disconnect();
    _socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: GameWidget(game: _game)),
        Controls(socket: _socket),
      ],
    );
  }
}
