import 'dart:ui';

import 'package:flutter/material.dart';

class CanvasDrawPointPage extends StatelessWidget {
  const CanvasDrawPointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawPointPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawPointPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint _paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.grey;
    // x軸
    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), _paint);
    canvas.drawLine(Offset(size.width - 10, (size.height / 2) - 10),
        Offset(size.width, size.height / 2), _paint);
    canvas.drawLine(Offset(size.width - 10, (size.height / 2) + 10),
        Offset(size.width, size.height / 2), _paint);
    // y軸
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), _paint);
    canvas.drawLine(Offset(size.width / 2 - 10, 10), Offset(size.width / 2, 0), _paint);
    canvas.drawLine(Offset(size.width / 2 + 10, 10), Offset(size.width / 2, 0), _paint);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    // 点の集合体
    const List<Offset> points = [
      Offset(-120, -20),
      Offset(-80, -80),
      Offset(-40, -60),
      Offset(0, 0),
      Offset(40, -140),
      Offset(80, 120),
      Offset(120, -100),
    ];
    // 点を描く
    _paint
      ..color = Colors.red
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    // 点
    canvas.drawPoints(PointMode.points, points, _paint);

    _paint.strokeWidth = 3;
    // 線
    canvas.drawPoints(PointMode.lines, points, _paint);
    // 図形
    canvas.drawPoints(PointMode.polygon, points, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
