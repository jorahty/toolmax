import 'package:flutter/material.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Controls extends StatelessWidget {
  const Controls({super.key, required this.socket});

  final IO.Socket socket;

  sendInput() {
    socket.emit('msg');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: sendInput,
        child: const Text('send input'),
      ),
    );
  }
}
