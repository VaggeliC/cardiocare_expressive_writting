import 'dart:math';

import 'package:easy_localization/easy_localization.dart';

List<String> findWordRandomWords({int? wordCount = 1}) {
  final wordIndex = Random().nextInt(6);

  return ['cognitive.gameWord.words.$wordIndex'.tr()];
}

int point2DTo1DIndex(Point<int> point, int columns) =>
    (point.y * columns) + point.x;

bool isPointOnLine(Point? start, Point? end, Point point) {
  if (start == null || end == null) {
    return false;
  }

  final ab = sqrt(pow((end.x - start.x), 2) + pow((end.y - start.y), 2));
  final ap = sqrt(pow((point.x - start.x), 2) + pow((point.y - start.y), 2));
  final pb = sqrt(pow((end.x - point.x), 2) + pow((end.y - point.y), 2));

  return ab == ap + pb;
}
