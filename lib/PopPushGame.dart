import 'dart:ui';

import 'package:boxgame/service/particle/ParticleMoveService.dart';
import 'package:flame/game.dart';

class PopPushGame extends Game {

  late ParticleMoveService particleMoveService;

  PopPushGame() {
    this.particleMoveService = new ParticleMoveService(this);
  }

  @override
  Future<void> onLoad() async {
    this.particleMoveService.initResources();
  }

  @override
  void render(Canvas canvas) {
    this.particleMoveService.renderService(canvas);
  }

  @override
  void update(double dt) {
    this.particleMoveService.updateService(dt);
  }
}