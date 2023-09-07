import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

import 'components/player.dart';
import 'components/ball.dart';

class CanvasGame extends FlameGame {
  late Player leftPlayer;
  late Player rightPlayer;
  late Ball ball;

  @override
  Color backgroundColor() => const Color(0xff3a4260);

  @override
  Future<void> onLoad() async {
    final world = World();
    final cameraComponent = CameraComponent(world: world)
      ..viewport.position.y = -120
      ..viewfinder.zoom = 0.7;
    addAll([world, cameraComponent]);

    ball = Ball();
    leftPlayer = Player(color: const Color(0xff49a581));
    rightPlayer = Player(color: const Color(0xff6f8ae4));
    world.addAll([leftPlayer, rightPlayer, ball]);
  }

  void onMove(data) {
    leftPlayer.position.setValues(data[0], data[1]);
    leftPlayer.angle = data[2];
    rightPlayer.position.setValues(data[3], data[4]);
    rightPlayer.angle = data[5];
    ball.position.setValues(data[6], data[7]);
    ball.angle = data[8];
  }
}
