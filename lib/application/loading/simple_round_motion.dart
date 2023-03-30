import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/dash_path.dart';

class SimpleRoundMotion extends StatefulWidget {
  const SimpleRoundMotion({Key? key}) : super(key: key);

  @override
  State<SimpleRoundMotion> createState() => _SimpleRoundMotionState();
}

class _SimpleRoundMotionState extends State<SimpleRoundMotion> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  PointData points = PointData();
  double xPoint = 0;

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      duration: animDuration,
      lowerBound: 0,
      upperBound: 2 * pi,
      vsync: this,
    )..addListener(_collectPoint);
  }

  void _collectPoint() {
    xPoint += 2;
    points.push(Offset(xPoint, sin(_ctrl.value) * 100));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnim,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: RunCirclePainter(_ctrl.value),
                  ),
                ),
                Expanded(
                  child: CustomPaint(
                    painter: ChartPainter(points, _ctrl.value),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _startAnim() {
    _ctrl.forward();
  }
}

class RunCirclePainter extends CustomPainter {
  double value;

  RunCirclePainter(this.value);

  double get x => cos(value);

  double get y => sin(value);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 1;
    path.addOval(Rect.fromCircle(center: Offset.zero, radius: 100));
    // 破線path
    path = DashPath().dashPath(path);
    canvas.drawPath(path, paint);
    path.reset();
    path.addOval(Rect.fromCircle(center: Offset(x * 100, y * 100), radius: 10));
    canvas.drawPath(path, paint..style = PaintingStyle.fill);

    // 縦線
    canvas.drawLine(const Offset(150, -150), const Offset(150, 150), paint);
    canvas.drawLine(const Offset(140, -140), const Offset(150, -150), paint);
    canvas.drawLine(const Offset(160, -140), const Offset(150, -150), paint);
    // 軸
    TextPainter textPainter =
        TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    textPainter.text = const TextSpan(
      text: 'x',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );

    textPainter.layout();
    textPainter.paint(canvas, const Offset(120, -160));
    // 単振動
    path.reset();
    path.moveTo(x * 100, y * 100);
    path.lineTo(150, y * 100);
    path = DashPath().dashPath(path);
    canvas.drawPath(path, paint..style = PaintingStyle.stroke);
    // 直線単振動
    path.reset();
    // x = Asinωt
    // x: 運動幅
    // sinωt: 運動角度
    // A: 最大幅(100)
    path.addOval(Rect.fromCircle(center: Offset(150, y * 100), radius: 5));
    canvas.drawPath(path, paint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ChartPainter extends CustomPainter {
  final PointData pointData;
  final double value;

  ChartPainter(this.pointData, this.value);

  double get x => cos(value);

  double get y => sin(value);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 1;
    // 縦線
    canvas.drawLine(const Offset(-150, -150), const Offset(-150, 150), paint);
    canvas.drawLine(const Offset(-160, -140), const Offset(-150, -150), paint);
    canvas.drawLine(const Offset(-140, -140), const Offset(-150, -150), paint);
    // 横線
    canvas.drawLine(const Offset(-150, 0), const Offset(150, 0), paint);
    canvas.drawLine(const Offset(140, -10), const Offset(150, 0), paint);
    canvas.drawLine(const Offset(140, 10), const Offset(150, 0), paint);

    // 軸
    TextPainter textPainter =
        TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    textPainter.text = const TextSpan(
      text: 'x',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(-180, -160));
    // T
    textPainter.text = const TextSpan(
      text: 't',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(160, 0));
    // 軸の原点へ
    canvas.translate(-150, 0);
    canvas.drawPoints(
      PointMode.points,
      pointData.values,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.red
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PointData extends ChangeNotifier {
  final List<Offset> values = [];

  void push(Offset value) {
    values.add(value);
  }

  void clear() {
    values.clear();
    notifyListeners();
  }
}
