import 'package:flutter/material.dart';

class CanvasSkewPage extends StatelessWidget {
  const CanvasSkewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: SkewPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class SkewPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    final Paint _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.red;
    // 矩形
    canvas.drawRect(
        Rect.fromCenter(
          center: const Offset(0, 0),
          width: 160,
          height: 160,
        ),
        _paint);

    _paint.color = Colors.green;

    canvas.save();
    // 傾斜する
    canvas.skew(-0.4, 0);
    canvas.drawRect(
      Rect.fromCenter(
        center: const Offset(0, 0),
        width: 160,
        height: 160,
      ),
      _paint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
