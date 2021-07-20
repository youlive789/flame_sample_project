import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_sample_project/component/PopTarget.dart';
import 'package:flame_sample_project/component/Score.dart';
import 'package:flame_sample_project/component/ScoreText.dart';
import 'package:flame_sample_project/util/TextPaint.dart';

class PopPushGame extends BaseGame with HasTapableComponents {
  int popTargetCount = 0;
  int popTargetCountLimit = 10;

  late Score score;
  late ScoreText scoreText;

  @override
  Future<void> onLoad() async {
    // 점수 객체 초기화
    score = Score();
    scoreText = ScoreText(score.getScoreText(), normalTextPaint);

    // 팝푸시 자원 초기화
    final circleImg = await loadSprite("circle.png");
    Vector2 popTargetSize = Vector2.all(100);
    Vector2 pos = Vector2.array([size.x / 2, size.y / 2]);

    // 게임객체에 자원 추가
    add(scoreText
      ..anchor = Anchor.topCenter
      ..x = size.x / 2
      ..y = 32.0);
    add(PopTarget(pos, circleImg, popTargetSize));
    popTargetCount++;
  }

  void updateScore() {
    score.addPoint();
    scoreText.text = score.getScoreText();
  }
}
