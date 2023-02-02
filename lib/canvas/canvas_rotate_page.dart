import 'package:flutter/material.dart';
import 'dart:math';

class CanvasRotatePage extends StatelessWidget {
  const CanvasRotatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: RotatePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class RotatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    final Paint _paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..color = Colors.red;
    // 円
    canvas.drawCircle(const Offset(0, 0), 50, _paint);

    _paint.style = PaintingStyle.stroke;
    canvas.save();
    const int count = 12;
    for (int i = 0; i < count; i++) {
      var step = 2 * pi / count;
      // 線
      canvas.drawLine(
        const Offset(80, 0),
        const Offset(100, 0),
        _paint,
      );
      // Canvasを回転する
      canvas.rotate(step);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
