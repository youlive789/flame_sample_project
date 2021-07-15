import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_sample_project/component/PopTarget.dart';

class PopPushGame extends BaseGame with HasTapableComponents {
  @override
  Future<void> onLoad() async {
    final circleImg = await loadSprite("circle.png");
    Vector2 pos = Vector2.array([size.x / 2, size.y / 2]);
    Vector2 popTargetSize = Vector2.all(100);

    add(PopTarget(pos, circleImg, popTargetSize));
  }
}
