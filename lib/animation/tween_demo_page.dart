import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class TweenDemoPage extends StatefulWidget {
  const TweenDemoPage({Key? key}) : super(key: key);

  @override
  _TweenDemoPageState createState() => _TweenDemoPageState();
}

class _TweenDemoPageState extends State<TweenDemoPage> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final Tween<double> tween = Tween(begin: 50, end: 100);

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: animDuration,
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
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
                    painter: CirclePainter(radius),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  double get radius => tween.transform(_ctrl.value);

  void _startAnim() async {
    _ctrl.forward(from: 0);
  }
}

class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter(this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    DrawPathGrid().paint(canvas, size);
    final Paint _paint = Paint();
    _paint.color = Colors.green;
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);

    // 円形
    canvas.drawCircle(Offset.zero, radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
