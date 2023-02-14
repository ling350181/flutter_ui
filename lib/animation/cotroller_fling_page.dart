import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class ControllerFlingPage extends StatefulWidget {
  const ControllerFlingPage({Key? key}) : super(key: key);

  @override
  _ControllerFlingPageState createState() => _ControllerFlingPageState();
}

class _ControllerFlingPageState extends State<ControllerFlingPage>
    with SingleTickerProviderStateMixin {
  PointData points = PointData();
  late AnimationController _ctrl;

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: animDuration,
      lowerBound: 0,
      upperBound: 200,
    )..addListener(_collectPoint);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    points.dispose();
    super.dispose();
  }

  void _collectPoint() {
    points.push(_ctrl.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _startAnim,
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: LinePainter(
                      points: points,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _startAnim() async {
    _ctrl.reset();
    _ctrl.fling(
      velocity: 10,
      springDescription: SpringDescription.withDampingRatio(
        mass: 1.0,
        stiffness: 500.0,
        ratio: 5.0,
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final PointData points;

  LinePainter({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    DrawPathGrid().paint(canvas, size);
    canvas.translate(0, size.height / 2);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 2;
    List<Offset> drawPoint = [];
    for (int i = 0; i < points.values.length; i++) {
      drawPoint.add(Offset(3.0 * i, -points.values[i]));
    }
    canvas.drawPoints(
      PointMode.points,
      drawPoint,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PointData extends ChangeNotifier {
  final List<double> values = [];

  void push(double value) {
    values.add(value);
  }

  void clear() {
    values.clear();
    notifyListeners();
  }
}
