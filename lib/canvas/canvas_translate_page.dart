import 'package:flutter/material.dart';

class CanvasTranslatePage extends StatelessWidget {
  const CanvasTranslatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.yellow,
              height: 100,
              width: 100,
              child: CustomPaint(
                painter: TranslatePainter(false),
              ),
            ),
            Container(
              color: Colors.yellow,
              height: 100,
              width: 100,
              child: CustomPaint(
                painter: TranslatePainter(true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TranslatePainter extends CustomPainter {
  final bool show;
  TranslatePainter(this.show);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    if (show) {
      // キャンバスの開始点を画面の中央に移動します
      canvas.translate(size.width / 2, size.height / 2);
    }
    canvas.drawCircle(const Offset(0, 0), 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
