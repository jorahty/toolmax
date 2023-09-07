import 'package:flutter/material.dart';
import 'package:flame/components.dart';

import '../canvas.dart';

class Player extends PositionComponent with HasGameRef<CanvasGame> {
  static final _paint = Paint()..color = const Color(0xff49a581);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    width = 40 * 2;
    height = 80 * 2;
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    canvas.translate(x + width / 2, y + height / 2);
    canvas.rotate(angle);
    canvas.translate(-width / 2, -height / 2);
    canvas.drawRect(size.toRect(), _paint);
    canvas.restore();
  }
}
