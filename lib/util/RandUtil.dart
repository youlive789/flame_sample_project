import 'dart:math';

final rand = Random();

double doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;
