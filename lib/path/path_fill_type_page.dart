import 'package:flutter/material.dart';

class PathFillTypePage extends StatelessWidget {
  const PathFillTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: FillTypePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class FillTypePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    path.fillType = PathFillType.evenOdd;
    path
      ..addOval(Rect.fromCircle(center: const Offset(0, 0), radius: 50))
      ..addOval(Rect.fromCircle(center: const Offset(0, 50), radius: 50))
      ..addOval(Rect.fromCircle(center: const Offset(-50, 25), radius: 50))
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
