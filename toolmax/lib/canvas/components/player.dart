import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class Player extends PositionComponent {
  Player({required this.color}) {
    _paint = Paint()..color = color;
  }

  final Color color;
  late final Paint _paint;

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
