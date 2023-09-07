import 'package:flutter/material.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static final IO.Socket _socket = IO.io(
    'http://localhost:3000',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );

  _connectSocket() {
    _socket.onConnect((_) => print('Connection established'));
    _socket.onConnectError((data) => print('Connect Error: $data'));
    _socket.onDisconnect((_) => print('Socket. I0 server disconnected'));
  }

  @override
  void initState() {
    super.initState();
    _connectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
