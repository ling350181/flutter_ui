import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class CanvasTransformPage extends StatelessWidget {
  const CanvasTransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: TransformPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class TransformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint _paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.purple;
    // x軸
    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), _paint);
    canvas.drawLine(Offset(size.width - 10, (size.height / 2) - 10),
        Offset(size.width, size.height / 2), _paint);
    canvas.drawLine(Offset(size.width - 10, (size.height / 2) + 10),
        Offset(size.width, size.height / 2), _paint);
    // y軸
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), _paint);
    canvas.drawLine(Offset(size.width / 2 - 10, 10), Offset(size.width / 2, 0), _paint);
    canvas.drawLine(Offset(size.width / 2 + 10, 10), Offset(size.width / 2, 0), _paint);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..color = Colors.red;
    // 矩形
    canvas.drawRect(
        Rect.fromCenter(
          center: const Offset(0, 0),
          width: 100,
          height: 160,
        ),
        _paint);

    canvas.save();

    // 90度回転
    _paint.color = Colors.green;
    Matrix4 m4 = Matrix4.rotationZ(pi / 2);
    canvas.transform(m4.storage);
    canvas.drawRect(
      Rect.fromCenter(
        center: const Offset(0, 0),
        width: 100,
        height: 160,
      ),
      _paint,
    );
    canvas.restore();
    canvas.save();

    // 矩形移動
    _paint.color = Colors.blue;
    Matrix4 m4a = Matrix4.translationValues(size.width / 3, 0, 0);
    canvas.transform(m4a.storage);
    canvas.drawRect(
      Rect.fromCenter(
        center: const Offset(0, 0),
        width: 100,
        height: 160,
      ),
      _paint,
    );
    canvas.restore();
    // 四次行列移動
    // 線形代数

    _paint.color = Colors.yellow;
    var rect = Rect.fromCenter(
      center: const Offset(0, 0),
      width: 100,
      height: 160,
    );
    canvas.translate(-100, 0);
    canvas.transform(Float64List.fromList([1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]));

    canvas.drawArc(rect, 0, pi / 2 * 3, true, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
