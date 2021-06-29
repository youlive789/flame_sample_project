import 'dart:ui';

import 'package:flame/game.dart';

abstract class GameService {

  late Game game;

  GameService(Game game) {
    this.game = game;
  }

  void setConfig();
  void initResources();
  void renderService(Canvas canvas);
  void updateService(double dt);
}