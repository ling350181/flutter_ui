import 'package:flutter/material.dart';

class PaintAntiAliasPage extends StatelessWidget {
  const PaintAntiAliasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomPaint(
            painter: CirclePainter(),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    canvas.drawCircle(
        const Offset(100, 100),
        90,
        paint
          ..color = Colors.blue
          ..strokeWidth = 5);
    canvas.drawCircle(
        const Offset(100 + 190.0, 100),
        90,
        paint
          ..isAntiAlias = false
          ..color = Colors.red);
    // text
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = const TextSpan(
      text: "isAntiAlias: true",
      style: TextStyle(
        color: Colors.white,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(60, 200));
    // isAntiAlias:false
    textPainter.text = const TextSpan(
      text: "isAntiAlias: false",
      style: TextStyle(
        color: Colors.white,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(250, 200));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
