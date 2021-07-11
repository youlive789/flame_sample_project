import 'package:flame/components.dart';

mixin SimpleCollidable on SpriteComponent {
  void onCollision(SimpleCollidable other) {}
  void onCollisionWall() {}
}
