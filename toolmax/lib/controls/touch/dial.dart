import 'package:flutter/material.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Dial extends StatefulWidget {
  const Dial({super.key, required this.socket});

  final IO.Socket socket;

  @override
  State<Dial> createState() => _DialState();
}

class _DialState extends State<Dial> {
  sendInput(DragUpdateDetails details) {
    widget.socket.emit('r', details.delta.dy / 50);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: sendInput,
      child: Container(
        height: 250,
        width: 100,
        decoration: BoxDecoration(
          color: const Color(0xff6f8ae4),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
