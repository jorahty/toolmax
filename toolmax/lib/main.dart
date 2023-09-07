import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'socket/uri.dart';
import 'canvas/canvas.dart';
import 'controls/controls.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late IO.Socket _socket;
  late CanvasGame _game;

  @override
  void initState() {
    super.initState();

    _socket = IO.io(
      socketUri,
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    _socket.onConnect((_) => print('connected'));
    _socket.onConnectError((msg) => print('connect error: $msg'));
    _socket.onError((msg) => print('error: $msg'));

    _game = CanvasGame();
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
