import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathMoveToPage extends StatelessWidget {
  const PathMoveToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: MoveToPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class MoveToPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    // 絶対位置
    //_moveToDraw(canvas);
    // 相対位置
    _relativeMoveToDraw(canvas);
  }

  // 絶対位置の移動
  _moveToDraw(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    path
      ..moveTo(-120, -20) // ペンを(-120,-20)へ移動
      ..lineTo(-80, -80) // (-120,-20)から(-80, -80)線を描く
      ..lineTo(-40, -60) // (-80, -80)から(-40, -60)線を描く
      ..lineTo(0, 0)
      ..lineTo(40, -140)
      ..lineTo(80, 120)
      ..lineTo(120, -100);
    canvas.drawPath(path, paint);
  }

  // 相対位置の移動
  _relativeMoveToDraw(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    path
      ..relativeMoveTo(-120, -20)
      ..relativeLineTo(40, -60)
      ..relativeLineTo(40, 20)
      ..relativeLineTo(40, 60)
      ..relativeLineTo(40, -140)
      ..relativeLineTo(40, 260)
      ..relativeLineTo(40, -220);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
