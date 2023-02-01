import 'package:flutter/material.dart';

class PaintStrokeCapPage extends StatelessWidget {
  const PaintStrokeCapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomPaint(
            painter: StrokeCapPainter(),
          ),
        ),
      ),
    );
  }
}

class StrokeCapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    StrokeCap.values.map((e) {
      canvas.drawLine(
          Offset(50 + e.index * 100, 50),
          Offset(50 + e.index * 100, 250),
          paint
            ..color = Colors.red
            ..strokeWidth = 25
            ..strokeCap = e);
      TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
      textPainter.text = TextSpan(
        text: e.toString().split(".")[1],
        style: const TextStyle(
          color: Colors.white,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(40 + e.index * 100, 270));
    }).toList();
    // 基準線
    canvas.drawLine(
      const Offset(20, 50),
      const Offset(370, 50),
      paint
        ..color = Colors.green
        ..strokeWidth = 2,
    );
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = const TextSpan(
      text: "基準線",
      style: TextStyle(
        color: Colors.red,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(370, 50));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
