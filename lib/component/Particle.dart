import 'package:flame_sample_project/physics/SimpleCollidable.dart';
import 'package:flame_sample_project/util/RandUtil.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Particle extends SpriteComponent with SimpleCollidable {
  late Vector2 velocity;

  Particle(Vector2 position, Sprite sprite)
      : super(position: position, size: Vector2.all(15.0), sprite: sprite) {
    velocity = Vector2.array(
        [doubleInRange(rand, -100, 100), doubleInRange(rand, -100, 100)]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(velocity * dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onCollision(SimpleCollidable other) {
    velocity.negate();
  }

  @override
  void onCollisionWall() {
    velocity.negate();
  }
}
