class Score {
  int _point = 0;
  final _popPushGameScorePrefix = "score : ";

  String getScoreText() {
    return _popPushGameScorePrefix + _point.toString();
  }

  void addPoint() {
    _point++;
  }
}
