import 'package:flutter/material.dart';
import 'package:flame/components.dart';

import '../canvas.dart';

class Ball extends PositionComponent with HasGameRef<CanvasGame> {
  static final _paint = Paint()..color = const Color(0xffc4b3d9);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(position.toOffset(), 40 * 2, _paint);
  }
}
