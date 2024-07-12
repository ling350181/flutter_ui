import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasClipRRectPage extends StatelessWidget {
  const CanvasClipRRectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawClipRRectPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawClipRRectPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint();
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint.color = Colors.green;
    Rect rect = Rect.fromCenter(center: Offset.zero, width: 200, height: 200);
    // キャンバスのクリップ
    canvas.clipRRect(RRect.fromRectAndRadius(rect, const Radius.circular(30)));
    canvas.drawPaint(_paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
