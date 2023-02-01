import 'package:flutter/material.dart';

class PaintStrokeJoinPage extends StatelessWidget {
  const PaintStrokeJoinPage({Key? key}) : super(key: key);
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
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    StrokeJoin.values.map((e) {
      Path path = Path();
      path.moveTo(50 + e.index * 100, 50);
      path.lineTo(50 + e.index * 100, 230);
      path.relativeLineTo(50, -50);
      canvas.drawPath(path, paint..strokeJoin = e);
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
