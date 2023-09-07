import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  final game = CanvasGame();

  final IO.Socket socket = IO.io(
    'http://localhost:3000',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );

  socket.onConnectError((msg) => print('connect error: $msg'));
  socket.on('move', game.onMove);

  runApp(
    GameWidget(game: game),
  );
}

class CanvasGame extends FlameGame {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();

    add(player);
  }

  void onMove(data) {
    player.move(Vector2(data, data));
  }
}

class Player extends PositionComponent with HasGameRef<CanvasGame> {
  static final _paint = Paint()..color = Colors.white;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    position = gameRef.size / 2;
    width = 100;
    height = 150;
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
