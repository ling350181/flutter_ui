import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/draw_path_grid.dart';

class PathMetricsPage extends StatefulWidget {
  const PathMetricsPage({Key? key}) : super(key: key);

  @override
  State<PathMetricsPage> createState() => _PathMetricsPageState();
}

class _PathMetricsPageState extends State<PathMetricsPage> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: const Duration(seconds: 3), vsync: this)..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: PathMetricsPainter(_ctrl),
            ),
          ),
        ],
      ),
    );
  }
}

class PathMetricsPainter extends CustomPainter {
  final AnimationController progress;

  PathMetricsPainter(this.progress) : super(repaint: progress);
  @override
  void paint(Canvas canvas, Size size) {
    DrawPathGrid().paint(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    // 円
    path.addOval(Rect.fromCenter(center: Offset.zero, width: 50, height: 50));
    path.addOval(Rect.fromCenter(center: Offset.zero, width: 100, height: 100));
    canvas.drawPath(path, paint);
    PathMetrics pms = path.computeMetrics();
    for (PathMetric pm in pms) {
      Tangent? tangent = pm.getTangentForOffset(pm.length * progress.value);
      if (tangent == null) return;
      print("---position:-${tangent.position}");
      print("----angle:-${tangent.angle}");
      print("----vector:-${tangent.vector}----");
      canvas.drawCircle(tangent.position, 5, Paint()..color = Colors.blue);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
