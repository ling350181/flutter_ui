import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/dash_path.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class TrianglePage extends StatelessWidget {
  const TrianglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: TrianglePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DrawPathGrid().paint(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    int count = 3;
    double radius = 100;
    List<Offset> points = [];
    for (int i = 0; i < count; i++) {
      // 始点は0°
      double perRad = 2 * pi / count * i;
      points.add(Offset(radius * cos(perRad - pi / 2), radius * sin(perRad - pi / 2)));
    }
    path.addPolygon(points, true);
    canvas.drawPath(path, paint);
    // 円
    path.reset();
    // 破線(応用：破線編)
    path = DashPath().dashPath(path..addOval(Rect.fromCircle(center: Offset.zero, radius: radius)));
    paint.color = Colors.blue;
    path.addPath(path, Offset.zero);
    canvas.drawPath(path, paint);
    // 点
    paint
      ..color = Colors.green
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
