import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PaintShaderLinearPage extends StatelessWidget {
  const PaintShaderLinearPage({Key? key}) : super(key: key);

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
                              height: 140,
                              width: 220,
                              child: CustomPaint(
                                painter: LinearPainter(e),
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

class LinearPainter extends CustomPainter {
  final TileMode tileMode;

  LinearPainter(this.tileMode);
  @override
  void paint(Canvas canvas, Size size) {
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
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeJoin = StrokeJoin.miter
      ..strokeWidth = 100;

    paint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(100, 0),
      colors,
      pos,
      tileMode,
    );
    canvas.drawLine(
      const Offset(0, 80),
      const Offset(200, 80),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
