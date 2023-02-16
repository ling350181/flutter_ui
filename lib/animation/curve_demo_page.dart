import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class CurveDemoPage extends StatefulWidget {
  const CurveDemoPage({Key? key}) : super(key: key);

  @override
  _CurveDemoPageState createState() => _CurveDemoPageState();
}

class _CurveDemoPageState extends State<CurveDemoPage> with SingleTickerProviderStateMixin {
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
    curveAnim = CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut);
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
    DrawPathGrid().paintChart(canvas, size);
    canvas.translate(0, size.height);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 3;
    List<Offset> drawPoint = [];
    for (int i = 0; i < points.values.length; i++) {
      print(points.values[i]);
      drawPoint.add(Offset(3.0 * i, -points.values[i] * (size.height - 50) / 2));
    }
    canvas.drawPoints(
      PointMode.points,
      drawPoint,
      paint,
    );
    // 運動軌跡
    if (points.values.isNotEmpty) {
      canvas.drawCircle(
        Offset(points.values.length * 3, -points.values.last * (size.height - 50) / 2),
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
