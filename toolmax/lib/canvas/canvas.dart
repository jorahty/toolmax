import 'package:flame/game.dart';

import 'components/player.dart';

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
