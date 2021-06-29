import 'package:boxgame/PopPushGame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final myGame = PopPushGame();
  runApp(GameWidget(game: myGame));
}
