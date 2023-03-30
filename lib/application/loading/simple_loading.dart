import 'dart:math';

import 'package:flutter/material.dart';

class SimpleLoading extends StatefulWidget {
  const SimpleLoading({Key? key}) : super(key: key);

  @override
  State<SimpleLoading> createState() => _SimpleLoadingState();
}

class _SimpleLoadingState extends State<SimpleLoading> with SingleTickerProviderStateMixin {
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
                  painter: SimpleLoadingPainter(_ctrl),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SimpleLoadingPainter extends CustomPainter {
  Animation<double> animation;

  SimpleLoadingPainter(this.animation) : super(repaint: animation);

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
      ..strokeWidth = 1;
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, breatheTween.evaluate(animation));

    Path result = Path();
    result.addArc(Rect.fromCircle(center: const Offset(0, 0), radius: 100), 0, pi * 0.75);
    canvas.save();
    canvas.rotate(animation.value * 2 * pi);
    paint
      ..style = PaintingStyle.stroke
      ..color = const Color(0xff00abf2);
    canvas.drawPath(result, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
