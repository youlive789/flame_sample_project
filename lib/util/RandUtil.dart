import 'dart:math';

final randUtil = Random();

double doubleInRange(Random source, num start, num end) => 
    source.nextDouble() * (end - start) + start;