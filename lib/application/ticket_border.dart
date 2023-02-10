import 'dart:math';

import 'package:flutter/material.dart';

class TicketBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.all(0);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double w = rect.width;
    double h = rect.height;

    Path path = Path();
    // 矩形枠
    path.addRect(rect);

    // 左上
    path.lineTo(40, 0);
    path.arcToPoint(
      const Offset(0, 40),
      radius: const Radius.circular(40),
    );

    // 右上
    path.moveTo(w, 0);
    path.lineTo(w - 40, 0);
    path.arcToPoint(
      Offset(w, 40),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    // 右下
    path.moveTo(w, h);
    path.lineTo(w, h - 40);
    path.arcToPoint(
      Offset(w - 40, h),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    // 左下
    path.moveTo(0, h);
    path.lineTo(0, h - 40);
    path.arcToPoint(
      Offset(40, h),
      radius: const Radius.circular(40),
    );
    _leftEdge(path, h);
    _rightEdge(path, h, w);
    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    var w = rect.width;
    var h = rect.height;
    canvas.drawRect(Rect.fromPoints(const Offset(40, 25), Offset(w - 40, h - 25)), paint);
  }

  @override
  ShapeBorder scale(double t) {
    throw UnimplementedError();
  }

  _leftEdge(Path path, double h) {
    double radius = 4;
    int holeCount = (h - 80) ~/ (radius * 2);
    for (int i = 0; i < holeCount; i++) {
      if (i % 2 == 0) {
        path.addArc(
          Rect.fromCircle(center: Offset(0, 44 + i * radius * 2), radius: radius),
          pi / 2,
          pi,
        );
      } else {
        path.addArc(
          Rect.fromCircle(center: Offset(0, 44 + i * radius * 2), radius: radius),
          -pi / 2,
          pi,
        );
      }
    }
  }

  _rightEdge(Path path, double h, double w) {
    double radius = 4;
    int holeCount = (h - 80) ~/ (radius * 2);
    for (int i = 0; i < holeCount; i++) {
      if (i % 2 == 0) {
        path.addArc(
          Rect.fromCircle(center: Offset(w, 44 + i * radius * 2), radius: radius),
          -pi / 2,
          pi,
        );
      } else {
        path.addArc(
          Rect.fromCircle(center: Offset(w, 44 + i * radius * 2), radius: radius),
          pi / 2,
          pi,
        );
      }
    }
  }
}
