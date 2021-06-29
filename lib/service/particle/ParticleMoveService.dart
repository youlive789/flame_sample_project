import 'dart:ui';
import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/palette.dart';

import 'package:boxgame/obj/Particle.dart';
import 'package:boxgame/service/GameService.dart';

class ParticleMoveService extends GameService{

  @override
  late Game game;
  late int screenWidth;
  late int screenHeight;
  late double particleSize;
  late int particleNumber;
  late List<Paint> colorPalette;

  final rnd = Random();
  final List<Particle<Rect>> particleEnsemble = [];

  ParticleMoveService(Game game) : super(game) {
    this.setConfig();
  }

  @override
  void setConfig() {
    this.screenWidth = window.physicalSize.width.toInt();
    this.screenHeight = window.physicalSize.height.toInt();
    this.particleSize = 5;
    this.particleNumber = 500;
    this.colorPalette = [BasicPalette.white.paint(), BasicPalette.red.paint(), BasicPalette.magenta.paint(), BasicPalette.blue.paint()];
  }

  @override
  void initResources() {
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
  void renderService(Canvas canvas) {
      for (var particle in particleEnsemble) {
        canvas.drawRect(particle.pos, particle.color);
      }
    }
  
    @override
    void updateService(double dt) {
        for (var particle in particleEnsemble) {
          particle.pos = particle.pos.translate(particle.speed[0] * particle.direction[0] * dt, particle.speed[1] * particle.direction[1] * dt);

          if (particle.direction[0] == 1 && particle.pos.right > game.size.x) {
            particle.direction[0] = -1;
          } else if (particle.direction[0] == -1 && particle.pos.left < 0) {
            particle.direction[0] = 1;
          } else if (particle.direction[1] == 1 && particle.pos.bottom > game.size.y) {
            particle.direction[1] = -1;
          } else if (particle.direction[1] == -1 && particle.pos.top < 0) {
            particle.direction[1] = 1;
          }
        }
  }


}