import 'dart:math';

import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  final double progress;

  RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final trackPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, 75, trackPaint);

    final arcPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final startAngle =
        (3 * pi) /
        2; // refer Angles in Flutter Tricks. Tip: Angles are measured from 0 degrees from 3'o clock
    final sweepAngle = pi * 2 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 75),
      startAngle,
      sweepAngle,
      false, // use center
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
