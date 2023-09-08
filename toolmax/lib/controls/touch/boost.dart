import 'package:flutter/material.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class BoostButton extends StatefulWidget {
  const BoostButton({super.key, required this.socket});

  final IO.Socket socket;

  @override
  State<BoostButton> createState() => _BoostButtonState();
}

class _BoostButtonState extends State<BoostButton> {
  sendInput() {
    widget.socket.emit('msg');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: sendInput,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: const Color(0xff6f8ae4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'B',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
