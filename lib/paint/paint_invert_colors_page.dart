import 'package:flutter/material.dart';

class PaintInvertColors extends StatelessWidget {
  const PaintInvertColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: InvertColorsPainter(),
        ),
      ),
    );
  }
}

class InvertColorsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(90, 0);
    var paint = Paint();
    paint.color = Colors.green;
    canvas.drawCircle(
      const Offset(0, 100),
      80,
      paint..invertColors = false,
    );
    // 色相環反対色
    canvas.drawCircle(
      const Offset(180.0, 100),
      80,
      paint..invertColors = true,
    );
    canvas.translate(-10, 0);
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = const TextSpan(
      text: "色相環:false",
      style: TextStyle(
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(0, 190));
    textPainter.text = const TextSpan(
      text: "色相環:true",
      style: TextStyle(
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(160, 190));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
