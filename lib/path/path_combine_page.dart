import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathCombinePage extends StatelessWidget {
  const PathCombinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: PathCombinePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class PathCombinePainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(100, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    // path1
    Path path1 = Path();
    path1.addOval(Rect.fromCircle(center: Offset.zero, radius: 20));
    // path2
    Path path2 = Path();
    Rect rect = Rect.fromCenter(
      center: const Offset(0, 0),
      width: 200,
      height: 200,
    );
    path2.lineTo(0, 100);
    path2.arcTo(rect, pi / 2, pi / 8, false);
    path2.close();

    PathOperation.values.map((e) {
      canvas.drawPath(
        Path.combine(
          e,
          path1.transform(Matrix4.translationValues(e.index * 100, 0, 0).storage),
          path2.transform(Matrix4.translationValues(e.index * 100, 0, 0).storage),
        ),
        paint,
      );
      TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
      textPainter.text = TextSpan(
        text: e.toString().split(".")[1],
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(-20 + e.index * 100, -50));
    }).toList();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
