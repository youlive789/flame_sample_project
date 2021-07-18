import 'package:flame/components.dart';
import 'package:flame/gestures.dart';
import 'package:flame_sample_project/game/PopPushGame.dart';
import 'package:flame_sample_project/util/RandUtil.dart';

class PopTarget extends SpriteComponent with HasGameRef<PopPushGame>, Tapable {
  double _timeLimit = 3.0;
  late Sprite _popTargetSprite;

  PopTarget(Vector2 position, Sprite sprite, Vector2 size)
      : super(position: position, size: size, sprite: sprite) {
    this._popTargetSprite = sprite;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_timeLimit <= 0) {
      this.remove();
      this.gameRef.add(_getRandomPopTarget());
    } else {
      _timeLimit -= dt;
    }
  }

  @override
  bool onTapDown(TapDownInfo event) {
    this.shouldRemove = true;
    this.gameRef.add(_getRandomPopTarget());
    this.gameRef.updateScore();
    return true;
  }

  PopTarget _getRandomPopTarget() {
    Vector2 randomPosition = Vector2.array([
      doubleInRange(rand, 100, this.gameRef.size.x - 100),
      doubleInRange(rand, 100, this.gameRef.size.y - 100)
    ]);
    return PopTarget(randomPosition, _popTargetSprite, size);
  }
}
