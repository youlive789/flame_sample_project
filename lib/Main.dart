import 'package:flame_sample_project/HardcoreCollisionGame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  // 엣지 테스트
  // flutter run -d edge --web-port=8080 --web-hostname=127.0.0.1 --profile

  // 폰 성능 테스트
  // flutter run --observatory-port=9200 --profile

  final game = HardcoreCollisionGame();
  runApp(GameWidget(game: game));

  // final game = PopPushGame();
  // runApp(GameWidget(game: game));
}
