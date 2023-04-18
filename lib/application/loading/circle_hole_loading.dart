import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// シンプル回転円
class CircleHoleLoading extends StatefulWidget {
  const CircleHoleLoading({Key? key}) : super(key: key);

  @override
  State<CircleHoleLoading> createState() => _CircleHoleLoadingState();
}

class _CircleHoleLoadingState extends State<CircleHoleLoading> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _ctrl.repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CustomPaint(
                  painter: CircleHoleLoadingPainter(_ctrl),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CircleHoleLoadingPainter extends CustomPainter {
  Animation<double> animation;

  CircleHoleLoadingPainter(this.animation) : super(repaint: animation);

  final Animatable<double> breatheTween = TweenSequence<double>(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 4),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 4, end: 0),
        weight: 1,
      ),
    ],
  ).chain(CurveTween(curve: Curves.decelerate));
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.purple
      ..strokeWidth = 1;
    // 光輪
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, breatheTween.evaluate(animation));
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.cyan,
      Colors.blue,
      Colors.purple,
    ];

    colors.addAll(colors.toList());

    final List<double> pos = List.generate(colors.length, (index) => index / colors.length);
    // shader
    paint.shader = ui.Gradient.sweep(Offset.zero, colors, pos, TileMode.clamp, 0, 2 * pi);
    Path path = Path();
    path.addOval(Rect.fromCenter(center: Offset.zero, width: 200, height: 200));
    canvas.save();
    canvas.rotate(animation.value * 2 * pi);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
