import 'dart:ui';

class Particle<T> {
  late List<int> speed;
  late List<int> direction;
  late T pos;
  late Paint color;

  Particle(List<int> speed, List<int> direction, T pos, Paint color) {
    this.speed = speed;
    this.direction = direction;
    this.pos = pos;
    this.color = color;
  }
}