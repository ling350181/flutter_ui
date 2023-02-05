import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathAddRectPage extends StatelessWidget {
  const PathAddRectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: AddRectPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class AddRectPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    canvas.translate(-120, 0);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromPoints(
      const Offset(100, 100),
      const Offset(160, 160),
    );
    path
      ..lineTo(100, 100)
      ..addRect(rect)
      ..relativeLineTo(100, -100)
      ..addRRect(RRect.fromRectXY(rect.translate(100, -100), 10, 10));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
