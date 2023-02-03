import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasDrawDRRectPage extends StatelessWidget {
  const CanvasDrawDRRectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawDRRectPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawDRRectPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint();
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    Rect outRect = Rect.fromCenter(center: const Offset(0, 0), width: 160, height: 160);
    Rect inRect = Rect.fromCenter(center: const Offset(0, 0), width: 100, height: 100);
    canvas.drawDRRect(RRect.fromRectXY(outRect, 0, 0), RRect.fromRectXY(inRect, 20, 20), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
