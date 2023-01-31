import 'package:flutter/material.dart';

class CircleDemoPage extends StatelessWidget {
  const CircleDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: CirclePainter(),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 筆
    final Paint paint = Paint();
    // 顔料を付く
    paint.color = Colors.green;
    // 紙に円を書く
    canvas.drawCircle(const Offset(100, 100), 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
