import 'package:flutter/material.dart';

class PaintBlendModePage extends StatelessWidget {
  const PaintBlendModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            children: BlendMode.values
                .map(
                  (e) => Container(
                    height: 220,
                    width: 220,
                    color: Colors.white,
                    child: CustomPaint(
                      painter: BlendModePainter(e),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class BlendModePainter extends CustomPainter {
  final BlendMode blendMode;

  BlendModePainter(this.blendMode);
  @override
  void paint(Canvas canvas, Size size) {
    drawBlendMode(canvas, blendMode);
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: blendMode.toString(),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(50, 200));
  }

  void drawBlendMode(Canvas canvas, BlendMode mode) {
    var paint = Paint();
    canvas.drawCircle(
      const Offset(100, 100),
      50,
      paint..color = Colors.red,
    );

    canvas.drawCircle(
      const Offset(140, 70),
      50,
      paint
        ..color = Colors.green
        ..blendMode = mode,
    );

    canvas.drawCircle(
      const Offset(140, 130),
      50,
      paint
        ..color = Colors.blue
        ..blendMode = mode,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
