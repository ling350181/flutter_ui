import 'package:flutter/material.dart';

enum PaintState { doing, done, other }

class LineModel {
  final List<Offset> points = [];
  PaintState state;
  final double strokeWidth;
  final Color color;

  LineModel({
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.state = PaintState.doing,
  });
}
