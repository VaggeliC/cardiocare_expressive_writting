import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final Offset? start;
  final Offset? end;
  final double strokeWidth;

  LinePainter({this.start, this.end, this.strokeWidth = 10}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (start == null || end == null) {
      return;
    }

    canvas.drawLine(
        start!,
        end!,
        Paint()
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth
          ..color = AppTheme.red);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.start != start || oldDelegate.end != end;
  }
}
