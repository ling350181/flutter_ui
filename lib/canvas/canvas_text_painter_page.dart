import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasTextPainterPage extends StatelessWidget {
  const CanvasTextPainterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawTextPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawTextPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);

    TextPainter textPainter = TextPainter(
      text: const TextSpan(
        text: "Hello, world!",
        style: TextStyle(
          fontSize: 28,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    // レイアウト
    textPainter.layout();
    // 描画
    textPainter.paint(canvas, Offset.zero);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
