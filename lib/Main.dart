import 'package:flame/widgets.dart';
import 'package:flame_sample_project/game/HardcoreCollisionGame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'game/PopPushGame.dart';

void main() {
  // 엣지 테스트
  // flutter run -d edge --web-port=8080 --web-hostname=127.0.0.1 --profile

  // 폰 성능 테스트
  // flutter run --observatory-port=9200 --profile

  // final game = HardcoreCollisionGame();
  // runApp(GameWidget(game: game));

  // 플러터 화면전환
  // https://flutter-ko.dev/docs/cookbook/navigation/navigation-basics
  // https://jap.alekhin.io/setup-widget-tree-flame-flutter-game

  final game = PopPushGame();
  runApp(GameWidget(game: game));
}
