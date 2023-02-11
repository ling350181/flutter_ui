import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/dash_path.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class StarPage extends StatelessWidget {
  const StarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: StarPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class StarPainter extends CustomPainter {
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
    int count = 10;
    double outRadius = 100;
    double innerRadius = 50;
    double offset = pi / count;
    List<Offset> points = [];
    List<Offset> helpPoints = [];
    for (int i = 0; i < count; i++) {
      // 始点は0°
      double perRad = 2 * pi / count * i;
      points.add(Offset(outRadius * cos(perRad - pi / 2), outRadius * sin(perRad - pi / 2)));
      points.add(
        Offset(
          innerRadius * cos(perRad - pi / 2 + offset),
          innerRadius * sin(perRad - pi / 2 + offset),
        ),
      );
      helpPoints.add(
        Offset(
          innerRadius * cos(perRad - pi / 2 + offset),
          innerRadius * sin(perRad - pi / 2 + offset),
        ),
      );
    }
    path.addPolygon(points, true);
    canvas.drawPath(path, paint);
    // 補助線
    path.reset();
    path.lineTo(helpPoints[0].dx, helpPoints[0].dy);
    path.addPolygon(helpPoints, true);
    path = DashPath().dashPath(path);
    paint.color = Colors.orange;
    canvas.drawPath(path, paint);
    // 円
    path.reset();
    // 破線(応用：破線編)
    path = DashPath().dashPath(
      path
        ..addOval(Rect.fromCircle(center: Offset.zero, radius: outRadius))
        ..addOval(Rect.fromCircle(center: Offset.zero, radius: innerRadius)),
    );
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
