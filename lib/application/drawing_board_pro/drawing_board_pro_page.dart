import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/application/drawing_board/color_select_item.dart';
import 'package:flutter_ui/application/drawing_board_pro/edit_modal.dart';
import 'package:flutter_ui/application/drawing_board_pro/line_model.dart';
import 'package:flutter_ui/application/drawing_board_pro/paint_view_model.dart';
import 'package:flutter_ui/application/drawing_board/pen_select_item.dart';

class DrawingBoardProPage extends StatefulWidget {
  const DrawingBoardProPage({Key? key}) : super(key: key);

  @override
  State<DrawingBoardProPage> createState() => _DrawingBoardProPageState();
}

class _DrawingBoardProPageState extends State<DrawingBoardProPage> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return Material(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 25),
                                            child: Text("色"),
                                          ),
                                          ColorSelectItem(
                                            colors: const [
                                              Colors.black,
                                              Colors.red,
                                              Colors.yellow,
                                              Colors.purple,
                                              Colors.blue,
                                              Colors.green,
                                              Colors.orange,
                                            ],
                                            defaultColor: paintViewModel.activeColor,
                                            onSelect: (Color color) {
                                              paintViewModel.renderPenColor(color);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 25),
                                            child: Text("筆"),
                                          ),
                                          PenSelectItem(
                                            numbers: const [
                                              1,
                                              3,
                                              5,
                                              6,
                                              8,
                                              10,
                                              15,
                                            ],
                                            defaultWidht: paintViewModel.activeWidth,
                                            onSelect: (double width) {
                                              paintViewModel.renderPenWidth(width);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Icon(
                          Icons.border_color,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return const Material(
                                color: Colors.white,
                                child: EditModal(),
                              );
                            },
                          );
                        },
                        child: const Text("編集"),
                      ),
                    ),
                  ],
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
                    onLongPressStart: (LongPressStartDetails details) {
                      paintViewModel.activeEditLine(details.localPosition);
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
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = element.color
        ..strokeWidth = element.strokeWidth;
      Path path = element.path;
      canvas.drawPath(element.path, _paint);
      if (element.state == PaintState.edit) {
        Paint paint1 = Paint()
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke
          ..color = Colors.red;
        canvas.drawRect(
            Rect.fromCenter(
                center: path.getBounds().center,
                width: path.getBounds().width + element.strokeWidth,
                height: path.getBounds().height + element.strokeWidth),
            paint1);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
