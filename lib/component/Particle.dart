import 'package:boxgame/util/RandUtil.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';

class Particle extends PositionComponent with Hitbox, Collidable {

  late Vector2 velocity;
  final color = Colors.blue;

  Particle(Vector2 position) 
    : super(
        position: position,
        size: Vector2.all(5.0),
        ) {
    addShape(HitboxCircle());
  }

  @override 
  Future<void> onLoad() async {
    velocity = Vector2.array([doubleInRange(randUtil, -15, 15), doubleInRange(randUtil, 15, 15)]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(velocity * dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    renderShapes(canvas);
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    if (other is Particle) {
      Vector2 thisVelocity = velocity;
      Vector2 otherVelocity = other.velocity;

      thisVelocity.negate();
      otherVelocity.negate();

      this.velocity = otherVelocity;
      other.velocity = thisVelocity;
    }
    else if (other is ScreenCollidable) {
      velocity.negate();
    }
  }
}