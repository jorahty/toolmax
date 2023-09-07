import 'package:flame/game.dart';
import 'package:flame/components.dart';

import 'components/player.dart';
import 'components/ball.dart';

class CanvasGame extends FlameGame {
  final world = World();
  late final CameraComponent cameraComponent;
  late Player leftPlayer;
  late Player rightPlayer;
  late Ball ball;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    cameraComponent = CameraComponent(world: world);
    cameraComponent.viewfinder.zoom = 0.5;
    addAll([cameraComponent, world]);

    leftPlayer = Player()..x = -200;
    rightPlayer = Player()..x = 200;
    ball = Ball();

    world.addAll([leftPlayer, rightPlayer, ball]);
  }

  void onMove(data) {
    print(data);
    // leftPlayer.move(Vector2(data, data));
  }
}
