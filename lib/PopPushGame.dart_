import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:boxgame/obj/Particle.dart';
import 'dart:math';

class PopPushGame extends Game {

  static final int screenWidth = window.physicalSize.width.toInt();

  static final int screenHeight = window.physicalSize.height.toInt();

  static const double particleSize = 5;

  static const int particleNumber = 500;

  final List<Particle<Rect>> particleEnsemble = [];

  final List<Paint> colorPalette = [BasicPalette.white.paint(), BasicPalette.red.paint(), BasicPalette.magenta.paint(), BasicPalette.blue.paint()];

  @override
  Future<void> onLoad() async {
    var rnd = new Random();

    for (int particleIndex = 0; particleIndex < particleNumber; ++particleIndex) {

      double initLeft = rnd.nextInt(screenWidth).toDouble();
      double initTop = rnd.nextInt(screenHeight).toDouble();

      List<int> initDirection = [rnd.nextBool() ? 1 : -1, rnd.nextBool() ? 1 : -1];
      List<int> initSpeed = [rnd.nextInt(49) + 1, rnd.nextInt(49) + 1];

      Rect paint = Rect.fromLTWH(initLeft, initTop, particleSize, particleSize);

      Particle<Rect> particle = new Particle(initSpeed, initDirection, paint, colorPalette[rnd.nextInt(4)]);
      particleEnsemble.add(particle);
    }
  }

  @override
  void render(Canvas canvas) {
    for (var particle in particleEnsemble) {
      canvas.drawRect(particle.pos, particle.color);
    }
  }

  @override
  void update(double dt) {
    for (var particle in particleEnsemble) {
      particle.pos = particle.pos.translate(particle.speed[0] * particle.direction[0] * dt, particle.speed[1] * particle.direction[1] * dt);

      if (particle.direction[0] == 1 && particle.pos.right > size.x) {
        particle.direction[0] = -1;
      } else if (particle.direction[0] == -1 && particle.pos.left < 0) {
        particle.direction[0] = 1;
      } else if (particle.direction[1] == 1 && particle.pos.bottom > size.y) {
        particle.direction[1] = -1;
      } else if (particle.direction[1] == -1 && particle.pos.top < 0) {
        particle.direction[1] = 1;
      }
    }
  }
}