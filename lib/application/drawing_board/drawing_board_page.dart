import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/application/drawing_board/line_model.dart';
import 'package:flutter_ui/application/drawing_board/paint_view_model.dart';

class DrawingBoardPage extends StatefulWidget {
  const DrawingBoardPage({Key? key}) : super(key: key);

  @override
  State<DrawingBoardPage> createState() => _DrawingBoardPageState();
}

class _DrawingBoardPageState extends State<DrawingBoardPage> {
  List<Offset> points = [];
  PaintViewModel paintViewModel = PaintViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      paintViewModel.clear();
                      setState(() {});
                    },
                    child: const Text("クリア"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: GestureDetector(
                    onPanDown: (DragDownDetails details) {
                      paintViewModel.initLineData();
                      setState(() {});
                    },
                    onPanUpdate: (details) {
                      final localPosition = (context.findRenderObject() as RenderBox)
                          .globalToLocal(details.localPosition);
                      paintViewModel.pushPoint(Offset(localPosition.dx, localPosition.dy));
                      setState(() {});
                    },
                    onPanEnd: (DragEndDetails details) {
                      paintViewModel.doneLine();
                      setState(() {});
                    },
                    onPanCancel: () {
                      paintViewModel.removeEmpty();
                    },
                    child: CustomPaint(
                      painter: DrawBoardPainter(paintViewModel),
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

class DrawBoardPainter extends CustomPainter {
  final PaintViewModel paintViewModel;

  DrawBoardPainter(this.paintViewModel);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint _paint = Paint();
    // 点を描く
    for (LineModel element in paintViewModel.lines) {
      _paint
        ..color = element.color
        ..strokeWidth = element.strokeWidth;
      canvas.drawPoints(PointMode.polygon, element.points, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
