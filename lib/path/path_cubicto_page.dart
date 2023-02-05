import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathCubicToPage extends StatelessWidget {
  const PathCubicToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: CubicToPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class CubicToPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    const Offset p1 = Offset(100, -100);
    const Offset p2 = Offset(160, 150);
    const Offset p3 = Offset(200, 0);
    canvas.translate(-120, 0);
    Paint paint = Paint();
    paint
      ..color = Colors.green
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    // p1
    canvas.drawPoints(PointMode.points, [p1], paint);
    // p2
    canvas.drawPoints(PointMode.points, [p2], paint);
    // 補助線
    paint.strokeWidth = 2;
    canvas.drawLine(const Offset(0, 0), p1, paint);
    canvas.drawLine(p2, p3, paint);
    Path path = Path();
    paint
      ..color = Colors.red
      ..strokeWidth = 2;
    path.cubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
