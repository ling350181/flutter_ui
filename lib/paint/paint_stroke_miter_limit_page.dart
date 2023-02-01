import 'package:flutter/material.dart';

class PaintStrokeMiterLimitPage extends StatelessWidget {
  const PaintStrokeMiterLimitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomPaint(
            painter: StrokeMiterLimitPainter(),
          ),
        ),
      ),
    );
  }
}

class StrokeMiterLimitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeJoin = StrokeJoin.miter;

    for (int i = 1; i <= 3; i++) {
      Path path = Path();
      path.moveTo(50 + (i + 1) * 100, 50);
      path.lineTo(50 + (i + 1) * 100, 230);
      path.relativeLineTo(50, -50);
      canvas.drawPath(path, paint..strokeMiterLimit = i.toDouble());
      TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
      textPainter.text = TextSpan(
        text: i.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(40 + (i + 1) * 100, 270));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
