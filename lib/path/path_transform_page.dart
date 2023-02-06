import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathTransformPage extends StatelessWidget {
  const PathTransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: PathTransformPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class PathTransformPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    Rect rect = Rect.fromCenter(
      center: const Offset(0, 0),
      width: 200,
      height: 200,
    );
    path.lineTo(100, 0);
    path.arcTo(rect, 0, pi / 8, false);
    path.close();
    for (int i = 1; i < 8; i++) {
      canvas.drawPath(path.transform(Matrix4.rotationZ(i * pi / 4).storage), paint);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
