import 'package:flutter/material.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'desktop/desktop.dart';
import 'mobile/mobile.dart';

class Controls extends StatelessWidget {
  const Controls({super.key, required this.socket});

  final IO.Socket socket;

  @override
  Widget build(BuildContext context) {
    return true ? MobileControls(socket: socket) : const DesktopControls();
  }
}
