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
    cameraComponent.viewport.position.y = -200;
    cameraComponent.viewfinder.zoom = 0.5;
    addAll([cameraComponent, world]);

    leftPlayer = Player();
    rightPlayer = Player();
    ball = Ball();

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
