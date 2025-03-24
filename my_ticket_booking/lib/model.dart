import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(size.width * 0.1, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.6, size.width * 0.5,
          size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.8, size.width * 0.9,
          size.height * 0.2);
    canvas.drawPath(path, paint);
    final boatPath = Path()
      ..moveTo(size.width * 0.45, size.height * 0.65)
      ..lineTo(size.width * 0.5, size.height * 0.6)
      ..lineTo(size.width * 0.55, size.height * 0.65)
      ..close();
    canvas.drawPath(boatPath, paint);
    final wavePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final wavePath = Path()
      ..moveTo(size.width * 0.45, size.height * 0.66)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.67,
          size.width * 0.55, size.height * 0.66);
    canvas.drawPath(wavePath, wavePaint);
    final mountainPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    final mountainPath = Path()
      ..moveTo(size.width * 0.8, size.height * 0.1)
      ..lineTo(size.width * 0.75, size.height * 0.2)
      ..lineTo(size.width * 0.85, size.height * 0.2)
      ..close();
    canvas.drawPath(mountainPath, mountainPaint);
    final mountainPath2 = Path()
      ..moveTo(size.width * 0.85, size.height * 0.1)
      ..lineTo(size.width * 0.8, size.height * 0.2)
      ..lineTo(size.width * 0.9, size.height * 0.2)
      ..close();
    canvas.drawPath(mountainPath2, mountainPaint);
    final sunPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width * 0.87, size.height * 0.1), 10, sunPaint);
    final treePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width * 0.2, size.height * 0.75), 15, treePaint);
    canvas.drawCircle(
        Offset(size.width * 0.22, size.height * 0.77), 10, treePaint);
    final treeTrunkPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
    canvas.drawLine(Offset(size.width * 0.2, size.height * 0.75),
        Offset(size.width * 0.2, size.height * 0.8), treeTrunkPaint);
    canvas.drawLine(Offset(size.width * 0.22, size.height * 0.77),
        Offset(size.width * 0.22, size.height * 0.82), treeTrunkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
