import 'package:flutter/painting.dart';

double findOptimalTextPainterWidth(TextPainter painter) {
  final height = painter.height;

  var left = 0.0;
  var right = painter.width;
  var best = painter.width;

  // binary search to efficiently find the optimal width
  while ((right - left) > 1) {
    final mid = (left + right) / 2;

    painter.layout(maxWidth: mid);

    if (painter.height <= height) {
      best = mid;
      right = mid;
    } else {
      left = mid;
    }
  }

  return best;
}
