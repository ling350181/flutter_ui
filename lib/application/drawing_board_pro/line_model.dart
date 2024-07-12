import 'package:flutter/material.dart';

enum PaintState { doing, done, edit, other }

class LineModel {
  final List<Offset> points = [];
  PaintState state;
  final double strokeWidth;
  final Color color;

  final Path _path = Path();

  Path recodePath = Path();

  LineModel({
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.state = PaintState.doing,
  });

  Path get path {
    if (points.isNotEmpty) {
      // 将路径的起始点设置为第一个点
      _path.moveTo(points.first.dx, points.first.dy);

      // 处理起始点
      _path.lineTo(points.first.dx, points.first.dy);
      if (points.length > 1) {
        final controlPointX = (points.first.dx + points[1].dx) / 2;
        final controlPointY = (points.first.dy + points[1].dy) / 2;
        _path.quadraticBezierTo(points.first.dx, points.first.dy, controlPointX, controlPointY);
      }

      // 处理中间点
      for (int i = 1; i < points.length - 1; i++) {
        final controlPointX = (points[i].dx + points[i + 1].dx) / 2;
        final controlPointY = (points[i].dy + points[i + 1].dy) / 2;
        _path.quadraticBezierTo(points[i].dx, points[i].dy, controlPointX, controlPointY);
      }

      // 处理结束点
      if (points.length > 1) {
        final controlPointX = (points[points.length - 1].dx + points[points.length - 2].dx) / 2;
        final controlPointY = (points[points.length - 1].dy + points[points.length - 2].dy) / 2;
        _path.quadraticBezierTo(points[points.length - 1].dx, points[points.length - 1].dy,
            controlPointX, controlPointY);
      }
    }
    return _path;
  }

  void recode() {
    recodePath = path.shift(Offset.zero);
  }
}
