import 'dart:math';

import 'package:boxgame/util/RandUtil.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'component/Particle.dart';

class HardcoreCollisionGame extends BaseGame with HasCollidables {

  @override
  Future<void> onLoad() async {
    add(ScreenCollidable());
    for (int i = 0; i < 100; ++i) {
      var pos = Vector2.array([doubleInRange(randUtil, 0, size.x), doubleInRange(randUtil, 0, size.y)]);
      add(Particle(pos));
    }
  }
}