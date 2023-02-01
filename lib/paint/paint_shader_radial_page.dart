import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PaintShaderRadialPage extends StatelessWidget {
  const PaintShaderRadialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(
                  children: TileMode.values
                      .map(
                        (e) => Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: 180,
                              child: CustomPaint(
                                painter: RadialPainter(e),
                              ),
                            ),
                            Text(e.toString())
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  final TileMode tileMode;

  RadialPainter(this.tileMode);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(100, 100);
    const colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];

    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    paint.shader = ui.Gradient.radial(
      const Offset(0, 0),
      40,
      colors,
      pos,
      tileMode,
    );
    // 半径80の円
    canvas.drawCircle(
      const Offset(0, 0),
      80,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
