import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathContainsPage extends StatelessWidget {
  const PathContainsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: ContainsPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainsPainter extends CustomPainter with DrawGridPain {
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
    path.lineTo(-50, 100);
    path
      ..relativeLineTo(50, -20)
      ..relativeLineTo(50, 20)
      ..close();
    canvas.drawPath(path, paint);

    // offset(0,50)とoffset(50,0)がpath内にあるかどうか
    Offset p1 = const Offset(0, 50);
    Offset p2 = const Offset(80, 0);
    paint
      ..color = Colors.green
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, [p1, p2], paint);
    print(path.contains(p1));
    print(path.contains(p2));
    // 領域を取得
    Rect rect = path.getBounds();
    paint
      ..color = Colors.blue
      ..strokeWidth = 2;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
