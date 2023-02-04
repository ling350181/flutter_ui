import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathArcToPointPage extends StatelessWidget {
  const PathArcToPointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: ArcToPointPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class ArcToPointPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    canvas.translate(0, -150);
    Path path = Path();
    Paint paint = Paint();
    drawPoints(canvas);

    paint
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    path.lineTo(80, -40);
    // 終了座標(40,40)
    // 半径60
    // 劣弧

    path
      ..arcToPoint(
        const Offset(40, 40),
        radius: const Radius.circular(60),
        largeArc: false,
      )
      ..close();
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(0, 150);
    // 終了座標(40,40)
    // 半径60
    // 優弧
    // 逆時計回り
    drawPoints(canvas);
    path.lineTo(80, -40);
    path
      ..arcToPoint(
        const Offset(40, 40),
        radius: const Radius.circular(60),
        largeArc: true,
        clockwise: false,
      )
      ..close();
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(0, 150);
    // 終了座標(40,40)
    // 半径60
    // 優弧
    // 相対位置
    drawPoints(canvas);
    path.lineTo(80, -40);
    path
      ..relativeArcToPoint(
        const Offset(-40, 80), // (80, -40)から相対位置
        radius: const Radius.circular(60),
        largeArc: true,
      )
      ..close();
    canvas.drawPath(path, paint);
  }

  drawPoints(Canvas canvas) {
    Paint paint = Paint();
    paint
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..color = Colors.green;
    canvas.drawPoints(PointMode.points, [const Offset(80, -40)], paint);
    canvas.drawPoints(PointMode.points, [const Offset(40, 40)], paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
