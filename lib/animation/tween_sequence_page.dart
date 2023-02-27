import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class TweenSequencePage extends StatefulWidget {
  const TweenSequencePage({Key? key}) : super(key: key);

  @override
  _TweenSequencePageState createState() => _TweenSequencePageState();
}

class _TweenSequencePageState extends State<TweenSequencePage> with SingleTickerProviderStateMixin {
  PointData points = PointData();
  late AnimationController _ctrl;
  final Tween<double> sunTween = Tween(begin: 0, end: 10);
  final Tween<double> parentTween = Tween(begin: 5, end: 15);

  late Animatable sequenceAnim;

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: animDuration,
    )..addListener(_collectPoint);
    sequenceAnim = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 100),
          weight: 1.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(100),
          weight: 1.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 100, end: 200).chain(CurveTween(curve: Curves.bounceInOut)),
          weight: 1.0,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    points.dispose();
    super.dispose();
  }

  void _collectPoint() {
    points.push(sequenceAnim.evaluate(_ctrl));
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
                padding: const EdgeInsets.all(58.0),
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
    DrawPathGrid(showScale: true).paintChart(canvas, size);
    canvas.translate(0, size.height);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 3;
    List<Offset> drawPoint = [];
    for (int i = 0; i < points.values.length; i++) {
      drawPoint.add(Offset(i * 3, -points.values[i]));
    }

    canvas.drawPoints(
      PointMode.points,
      drawPoint,
      paint,
    );
    // 運動軌跡
    if (points.values.isNotEmpty) {
      canvas.drawCircle(
        Offset(points.values.length * 3, -points.values.last),
        10,
        Paint()..color = Colors.red,
      );
    }
    paint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    if (points.values.isNotEmpty) {
      canvas.drawLine(
          Offset(0, -points.values.last), Offset(size.width, -points.values.last), paint);
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
