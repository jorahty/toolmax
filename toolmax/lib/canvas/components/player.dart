import 'package:flutter/material.dart';
import 'package:flame/components.dart';

import '../canvas.dart';

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
