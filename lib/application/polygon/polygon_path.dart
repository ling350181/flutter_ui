import 'dart:math';

import 'package:flutter/material.dart';

class PolygonPath {
  final int n;
  final double outRadius;
  final double? innerRadius;

  /// n角星のコンストラクター
  PolygonPath.start({
    this.n = 5,
    this.outRadius = 100,
    this.innerRadius = 50,
  });

  /// n角形のコンストラクター
  PolygonPath.polygon({
    this.n = 5,
    this.outRadius = 100,
  }) : innerRadius = null;

  Path get path {
    int count = n;
    double offset = pi / count;
    List<Offset> points = [];
    double rotate = -pi / 2;
    for (int i = 0; i < count; i++) {
      double perRad = 2 * pi / count * i;
      points.add(Offset(
        outRadius * cos(perRad + rotate),
        outRadius * sin(perRad + rotate),
      ));
      if (innerRadius != null) {
        points.add(Offset(
          innerRadius! * cos(perRad + rotate + offset),
          innerRadius! * sin(perRad + rotate + offset),
        ));
      }
    }

    Path path = Path();
    path.addPolygon(points, true);
    return path;
  }
}
