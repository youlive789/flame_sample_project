import 'package:boxgame/HardcoreCollisionGame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
    final game = HardcoreCollisionGame();
    runApp(GameWidget(game: game));
}