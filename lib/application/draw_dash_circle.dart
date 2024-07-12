import 'package:flutter/material.dart';
import 'package:flutter_ui/application/dash_path.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class DrawDashCircle extends StatelessWidget {
  const DrawDashCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DashPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DrawPathGrid().paint(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 2;
    Path path = Path();
    path.addOval(Rect.fromCircle(center: Offset.zero, radius: 100));
    // 破線path
    path = DashPath().dashPath(path);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
