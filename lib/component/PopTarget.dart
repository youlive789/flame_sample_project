import 'package:flame/components.dart';
import 'package:flame/gestures.dart';
import 'package:flame_sample_project/game/PopPushGame.dart';
import 'package:flame_sample_project/util/RandUtil.dart';

class PopTarget extends SpriteComponent with HasGameRef<PopPushGame>, Tapable {
  late Sprite popTargetSprite;

  PopTarget(Vector2 position, Sprite sprite, Vector2 size)
      : super(position: position, size: size, sprite: sprite) {
    this.popTargetSprite = sprite;
  }

  @override
  bool onTapDown(TapDownInfo event) {
    this.shouldRemove = true;
    this.gameRef.add(_getRandomPopTarget());
    return true;
  }

  PopTarget _getRandomPopTarget() {
    Vector2 randomPosition = Vector2.array([
      doubleInRange(rand, 100, this.gameRef.size.x - 100),
      doubleInRange(rand, 100, this.gameRef.size.y - 100)
    ]);
    return PopTarget(randomPosition, popTargetSprite, size);
  }
}
