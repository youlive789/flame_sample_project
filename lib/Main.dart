import 'package:boxgame/HardcoreCollisionGame.dart';
import 'package:boxgame/PopPushGame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {

    // 크롬 테스트
    // flutter run -d chrome --web-port=8080 --web-hostname=127.0.0.1

    final game = HardcoreCollisionGame();
    runApp(GameWidget(game: game));

    // final game = PopPushGame();
    // runApp(GameWidget(game: game));
}