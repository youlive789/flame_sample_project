class Score {
  int point = 0;
  final popPushGameScorePrefix = "score : ";

  String getScoreText() {
    return popPushGameScorePrefix + point.toString();
  }

  void addPoint() {
    point++;
  }
}
