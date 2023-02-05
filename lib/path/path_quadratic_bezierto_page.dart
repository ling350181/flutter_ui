import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathQuadraticBezierToPage extends StatelessWidget {
  const PathQuadraticBezierToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: QuadraticBezierToPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class QuadraticBezierToPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    const Offset p1 = Offset(100, -100);
    const Offset p2 = Offset(160, 50);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // 補助線
    canvas.drawLine(const Offset(0, 0), p1, paint);
    canvas.drawLine(p1, p2, paint);
    // ベジェ曲線
    paint.color = Colors.red;
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
