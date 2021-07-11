import 'package:boxgame/physics/SimpleCollidable.dart';
import 'package:flame/game.dart';

mixin HasSimplePhysics on BaseGame {
  final List<SimpleCollidable> _collidables = [];

  void handleCollision() {
    _collidables.clear();
    _collidables.addAll(components.whereType<SimpleCollidable>());
    detectParticleCollision();
    detectWallCollision();
  }

  void detectParticleCollision() {
    for (int i = 0; i < _collidables.length - 1; i++) {
      for (int j = i + 1; j < _collidables.length; j++) {
        SimpleCollidable first = _collidables[i];
        SimpleCollidable second = _collidables[j];
        if (_isCollisionDistance(first, second)) {
          first.onCollision(second);
          second.onCollision(first);
        }
      }
    }
  }

  void detectWallCollision() {
    _collidables.forEach((element) {
      if (element.position[0] < 0 || element.position[0] > size.x) {
        element.onCollisionWall();
      } else if (element.position[1] < 0 || element.position[1] > size.y) {
        element.onCollisionWall();
      }
    });
  }

  bool _isCollisionDistance(SimpleCollidable first, SimpleCollidable second) {
    return first.position.distanceTo(second.position) < 10;
  }
}
