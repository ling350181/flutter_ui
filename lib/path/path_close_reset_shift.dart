import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathCloseResetShift extends StatelessWidget {
  const PathCloseResetShift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: ClosePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class ClosePainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // クローズ
    path
      ..lineTo(100, 100)
      ..relativeLineTo(0, -200)
      ..close();
    canvas.drawPath(path, paint);
    // シフト
    canvas.drawPath(path.shift(const Offset(-100, 0)), paint..color = Colors.blue);
    // リセット
    path.reset();

    path
      ..lineTo(0, 100)
      ..addPath(
          Path()
            ..addOval(Rect.fromPoints(
              const Offset(-100, 100),
              const Offset(100, 200),
            )),
          Offset.zero);
    canvas.drawPath(path, paint..color = Colors.purple);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
