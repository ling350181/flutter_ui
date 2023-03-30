import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/dash_path.dart';

/// 円の直径単振動運動
class DiameterRun extends StatefulWidget {
  const DiameterRun({Key? key}) : super(key: key);

  @override
  State<DiameterRun> createState() => _DiameterRunState();
}

class _DiameterRunState extends State<DiameterRun> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      duration: animDuration,
      lowerBound: 0,
      upperBound: 2 * pi,
      vsync: this,
    );
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
            return CustomPaint(
              painter: DiameterRunPainter(_ctrl.value),
            );
          }),
    );
  }

  void _startAnim() {
    _ctrl.repeat();
  }
}

class DiameterRunPainter extends CustomPainter {
  double value;

  DiameterRunPainter(this.value);

  double get x => cos(value);

  double get y => sin(value);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 1;
    path.addOval(Rect.fromCircle(center: Offset.zero, radius: 100));
    // 破線path
    path = DashPath().dashPath(path);
    canvas.drawPath(path, paint);
    path.reset();
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
    // 2個目
    path.reset();
    value = value + pi * 0.125;
    canvas.rotate(pi * 0.125);
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
    // 3個目
    path.reset();
    value = value + pi * 0.125;
    canvas.rotate(pi * 0.125);
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
    // 4個目
    path.reset();
    value = value + pi * 0.125;
    canvas.rotate(pi * 0.125);
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
    // 5個目
    path.reset();
    value = value + pi * 0.125;
    canvas.rotate(pi * 0.125);
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
    // 6個目
    path.reset();
    value = value + pi * 0.125;
    canvas.rotate(pi * 0.125);
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
    // 7個目
    path.reset();
    value = value + pi * 0.125;
    canvas.rotate(pi * 0.125);
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
    // 8個目
    path.reset();
    value = value + pi * 0.125;
    canvas.rotate(pi * 0.125);
    path.addOval(Rect.fromCircle(center: Offset(0, y * 100), radius: 10));
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
