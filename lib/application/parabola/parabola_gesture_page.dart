import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class ParabolaGesturePage extends StatefulWidget {
  const ParabolaGesturePage({Key? key}) : super(key: key);

  @override
  _ParabolaGesturePageState createState() => _ParabolaGesturePageState();
}

class _ParabolaGesturePageState extends State<ParabolaGesturePage> {
  double p = 50;
  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  key: _key,
                  color: Colors.yellow,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      final RenderBox box = _key.currentContext!.findRenderObject()! as RenderBox;
                      final localPosition = box.globalToLocal(details.localPosition);
                      final centerHeight = box.size.height / 2;
                      final contextWidth = box.size.width;
                      if ((localPosition.dy - centerHeight).abs() < 10 &&
                          localPosition.dx > 20 &&
                          localPosition.dx < contextWidth) {
                        setState(() {
                          p += details.delta.dx;
                        });
                      }
                    },
                    child: CustomPaint(
                      painter: ParabolaPainter(p),
                      size: Size.infinite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParabolaPainter extends CustomPainter {
  /// 放物線参数
  final double p;

  ParabolaPainter(this.p);
  @override
  void paint(Canvas canvas, Size size) {
    //canvas.save();
    DrawPathGrid().paintTwoQuadrant(canvas, size);
    // 座標中心へ移動
    canvas.translate(0, size.height / 2);
    // 放物線　 𝑦2=4𝑝𝑥
    // 焦点： (𝑝, 0)

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();

    path.moveTo(size.width, -sqrt(4 * p * size.width));

    for (double x = size.width; x >= 0; x--) {
      final y = sqrt(4 * p * x);
      path.lineTo(x, -y);
    }
    for (double x = 0; x <= size.width; x++) {
      final y = sqrt(4 * p * x);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
    Offset p1 = Offset(p, 0);

    paint
      ..color = Colors.green
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, [p1], paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
