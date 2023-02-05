import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathConicToPage extends StatelessWidget {
  const PathConicToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: ConicToPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class ConicToPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    canvas.save();
    canvas.translate(-80, -120);
    const Offset p1 = Offset(80, -100);
    const Offset p2 = Offset(160, 0);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Paint paint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    // 放物線
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1);
    canvas.drawPoints(PointMode.points, [p1], paint1);
    canvas.drawPath(path, paint);

    path.reset();
    canvas.restore();
    canvas.save();
    canvas.translate(-80, 0);
    // 楕円
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 0.5);
    canvas.drawPoints(PointMode.points, [p1], paint1);
    canvas.drawPath(path, paint);

    path.reset();
    canvas.restore();
    canvas.translate(-80, 120);
    // 双曲線
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1.5);
    canvas.drawPoints(PointMode.points, [p1], paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
