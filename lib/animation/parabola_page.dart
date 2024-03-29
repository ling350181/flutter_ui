import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class ParabolaPage extends StatefulWidget {
  const ParabolaPage({Key? key}) : super(key: key);

  @override
  _ParabolaPageState createState() => _ParabolaPageState();
}

class _ParabolaPageState extends State<ParabolaPage> with SingleTickerProviderStateMixin {
  PointData points = PointData();
  late AnimationController _ctrl;
  late Animation<double> curveAnim;

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: animDuration,
    )..addListener(_collectPoint);
    curveAnim = CurvedAnimation(parent: _ctrl, curve: const ParabolaCurve());
  }

  @override
  void dispose() {
    _ctrl.dispose();
    points.dispose();
    super.dispose();
  }

  void _collectPoint() {
    points.push(curveAnim.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _startAnim,
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _startAnim() async {
    points.clear();
    _ctrl.forward(from: 0);
  }
}

class LinePainter extends CustomPainter {
  final PointData points;

  LinePainter({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    DrawPathGrid().paintOneQuadrant(canvas, size);
    canvas.translate(0, size.height);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 3;
    List<Offset> drawPoint = [];
    for (int i = 0; i < points.values.length; i++) {
      drawPoint.add(Offset(3.0 * i, -points.values[i] * 400));
    }

    canvas.drawPoints(
      PointMode.points,
      drawPoint,
      paint,
    );
    // 運動軌跡
    if (points.values.isNotEmpty) {
      canvas.drawCircle(
        Offset(points.values.length * 3, -points.values.last * 400),
        10,
        Paint()..color = Colors.red,
      );
    }
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

class ParabolaCurve extends Curve {
  const ParabolaCurve();
  @override
  double transformInternal(double t) {
    return t * t;
  }
}
