import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasClipPathPage extends StatelessWidget {
  const CanvasClipPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawClipPathPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawClipPathPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint();
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint.color = Colors.green;
    Path path = Path();
    path
      ..lineTo(100, 100)
      ..lineTo(-100, 100)
      ..close();
    canvas.clipPath(path);
    canvas.drawPaint(_paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
