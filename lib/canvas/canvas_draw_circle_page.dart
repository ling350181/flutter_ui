import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasDrawCirclePage extends StatelessWidget {
  const CanvasDrawCirclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawCirclePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawCirclePainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint();
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint.color = Colors.green;
    canvas.save();
    canvas.translate(-100, 0);
    // 円形
    canvas.drawCircle(const Offset(0, 0), 25, _paint);
    canvas.restore();

    // 楕円
    canvas.save();
    var rect = Rect.fromCenter(
      center: const Offset(0, 0),
      height: 40,
      width: 50,
    );
    canvas.translate(-40, 0);
    canvas.drawOval(rect, _paint);
    canvas.restore();

    // アーク
    canvas.save();
    canvas.translate(40, 0);
    canvas.drawArc(rect, 0, pi / 2 * 3, true, _paint);
    canvas.restore();

    // 中心に連結しない
    canvas.save();
    canvas.translate(100, 0);
    canvas.drawArc(rect, 0, pi / 2 * 3, false, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
