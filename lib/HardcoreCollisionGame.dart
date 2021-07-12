import 'package:flame_sample_project/physics/HasSimplePhysics.dart';
import 'package:flame_sample_project/util/RandUtil.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'component/Particle.dart';

class HardcoreCollisionGame extends BaseGame with HasSimplePhysics {
  @override
  Future<void> onLoad() async {
    final circleImg = await loadSprite("circle.png");

    for (int i = 0; i < 500; ++i) {
      Vector2 pos = Vector2.array(
          [doubleInRange(rand, 0, size.x), doubleInRange(rand, 0, size.y)]);
      add(Particle(pos, circleImg));
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    handleCollision();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
