import 'package:flame/components.dart';
import 'package:flame/gestures.dart';
import 'package:flame_sample_project/game/PopPushGame.dart';
import 'package:flame_sample_project/util/RandUtil.dart';

class PopTarget extends SpriteComponent with HasGameRef<PopPushGame>, Tapable {
  double _timeLimit = 2.0;
  late Sprite _popTargetSprite;

  PopTarget(Vector2 position, Sprite sprite, Vector2 size)
      : super(position: position, size: size, sprite: sprite) {
    this._popTargetSprite = sprite;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_timeLimit <= 0) {
      _deletePopTargetFromGame();
      _addPopTargetToGame();
    } else {
      _timeLimit -= dt;
    }

    if (_haveToGeneratePopTarget(
        this.gameRef.popTargetCount, this.gameRef.popTargetCountLimit)) {
      _addPopTargetToGame();
    }
  }

  @override
  bool onTapDown(TapDownInfo event) {
    this.shouldRemove = true;
    _addPopTargetToGame();
    this.gameRef.updateScore();
    return true;
  }

  void _addPopTargetToGame() {
    this.gameRef.add(_getRandomPopTarget());
    this.gameRef.popTargetCount++;
  }

  void _deletePopTargetFromGame() {
    this.gameRef.popTargetCount--;
    this.remove();
  }

  PopTarget _getRandomPopTarget() {
    Vector2 randomPosition = Vector2.array([
      doubleInRange(rand, 100, this.gameRef.size.x - 100),
      doubleInRange(rand, 100, this.gameRef.size.y - 100)
    ]);
    return PopTarget(randomPosition, _popTargetSprite, size);
  }

  bool _haveToGeneratePopTarget(int popTargetCount, int popTargetLimit) {
    if (rand.nextInt(200) == 0 && popTargetCount < popTargetLimit) {
      return true;
    }
    return false;
  }
}
