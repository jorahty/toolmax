import 'package:flame/game.dart';
import 'package:flame/components.dart';

import 'components/player.dart';

class CanvasGame extends FlameGame {
  final world = World();
  late final CameraComponent cameraComponent;
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    cameraComponent = CameraComponent(world: world);
    cameraComponent.viewfinder.zoom = 0.5;
    addAll([cameraComponent, world]);

    player = Player();

    world.add(player);
  }

  void onMove(data) {
    player.move(Vector2(data, data));
  }
}
