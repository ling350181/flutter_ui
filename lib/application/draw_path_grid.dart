import 'package:flutter/material.dart';

class DrawPathGrid {
  final Paint _gridPaint = Paint();

  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    _drawGridLine(canvas, size);
    _drawAxis(canvas, size);
    canvas.restore();
  }

  void paintChart(Canvas canvas, Size size) {
    canvas.save();
    _drawChartAxis(canvas, size);
    canvas.restore();
  }

  // xy軸
  void _drawAxis(Canvas canvas, Size size) {
    _gridPaint
      ..color = Colors.grey
      ..strokeWidth = 1.5;
    // x軸
    canvas.drawLine(Offset(-size.width / 2, 0), Offset(size.width / 2, 0), _gridPaint);
    // y軸
    canvas.drawLine(Offset(0, -size.height / 2), Offset(0, size.height / 2), _gridPaint);
    canvas.drawLine(Offset(0, size.height / 2), Offset(0 - 7.0, size.height / 2 - 10), _gridPaint);
    canvas.drawLine(Offset(0, size.height / 2), Offset(0 + 7.0, size.height / 2 - 10), _gridPaint);
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, 7), _gridPaint);
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, -7), _gridPaint);
  }

  // xy軸
  void _drawChartAxis(Canvas canvas, Size size) {
    _gridPaint
      ..color = Colors.grey
      ..strokeWidth = 1.5;
    // x軸
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), _gridPaint);
    // y軸
    canvas.drawLine(Offset.zero, Offset(0, size.height), _gridPaint);
    canvas.drawLine(Offset.zero, const Offset(0 - 7.0, 10), _gridPaint);
    canvas.drawLine(Offset.zero, const Offset(0 + 7.0, 10), _gridPaint);
    canvas.drawLine(
        Offset(size.width, size.height), Offset(size.width - 10, size.height + 7), _gridPaint);
    canvas.drawLine(
        Offset(size.width, size.height), Offset(size.width - 10, size.height - 7), _gridPaint);
  }

  // グリッド
  void _drawGridLine(Canvas canvas, Size size) {
    const double space = 20;
    final Path path = Path();

    _gridPaint
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5
      ..color = Colors.grey;

    for (int i = 0; i < size.width / 2 / space; i++) {
      path.moveTo(space * i, -size.height / 2);
      path.relativeLineTo(0, size.height);

      path.moveTo(-space * i, -size.height / 2);
      path.relativeLineTo(0, size.height);
    }

    for (int i = 0; i < size.height / 2 / space; i++) {
      path.moveTo(-size.width / 2, space * i);
      path.relativeLineTo(size.width, 0);

      path.moveTo(
        -size.width / 2,
        -space * i,
      );
      path.relativeLineTo(size.width, 0);
    }

    canvas.drawPath(path, _gridPaint);
  }
}
