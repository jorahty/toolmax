import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class Arena extends PolygonComponent {
  Arena()
      : super(
          [
            Vector2(715, 297),
            Vector2(570, 442),
            Vector2(-583, 442),
            Vector2(-728, 297),
            Vector2(-728, 141),
            Vector2(-907, 141),
            Vector2(-907, -95),
            Vector2(-728, -95),
            Vector2(-728, -535),
            Vector2(-17, -535),
            Vector2(-17, -699),
            Vector2(-1024, -699),
            Vector2(-1024, 677),
            Vector2(983, 677),
            Vector2(983, -699),
            Vector2(3, -699),
            Vector2(3, -535),
            Vector2(715, -535),
            Vector2(715, -95),
            Vector2(893, -95),
            Vector2(893, 141),
            Vector2(715, 141),
          ],
          anchor: Anchor.center,
          paint: Paint()..color = const Color(0xff5a6984),
        );
}
