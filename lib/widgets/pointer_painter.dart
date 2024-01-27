import 'package:flutter/material.dart';

class PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width / 2, 20);
    path.lineTo((size.width / 2) - 10, 0);
    path.lineTo((size.width / 2) + 10, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
