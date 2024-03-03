import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  State<GestureDetectorPage> createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  double panHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //ListViewとonPanUpdateイベント競合
          children: <Widget>[
            // GestureDetector(
            //   onTap: () {
            //     print('-----tap---------');
            //   },
            //   onTapDown: (TapDownDetails details) {
            //     print('-----onTapDown---------');
            //     print('-----Widget相対偏移値---${details.localPosition}------');
            //     print('-----スクリーン相対偏移値---${details.globalPosition}------');
            //     print('-----イベントを開始したデバイスの種類---${details.kind}------');
            //   },
            //   onTapCancel: () {
            //     print('-----onTapCancel---------');
            //   },
            //   onTapUp: (TapUpDetails details) {
            //     print('-----onTapUp---------');
            //     print('-----Widget相対偏移値---${details.localPosition}------');
            //     print('-----スクリーン相対偏移値---${details.globalPosition}------');
            //     print('-----イベントを開始したデバイスの種類---${details.kind}------');
            //   },
            //   child: Center(
            //     child: Container(
            //       color: Colors.blue,
            //       height: 100,
            //       width: 200,
            //       child: const Center(
            //         child: Text(
            //           "on tap",
            //           style: TextStyle(
            //             fontSize: 28,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // GestureDetector(
            //   onSecondaryTap: () {
            //     print('-----onSecondaryTap---------');
            //   },
            //   onSecondaryTapDown: (TapDownDetails details) {
            //     print('-----onSecondaryTapDown---------');
            //     print('-----Widget相対偏移値---${details.localPosition}------');
            //     print('-----スクリーン相対偏移値---${details.globalPosition}------');
            //     print('-----イベントを開始したデバイスの種類---${details.kind}------');
            //   },
            //   onSecondaryTapCancel: () {
            //     print('-----onSecondaryTapCancel---------');
            //   },
            //   onSecondaryTapUp: (TapUpDetails details) {
            //     print('-----onSecondaryTapUp---------');
            //     print('-----Widget相対偏移値---${details.localPosition}------');
            //     print('-----スクリーン相対偏移値---${details.globalPosition}------');
            //     print('-----イベントを開始したデバイスの種類---${details.kind}------');
            //   },
            //   child: Center(
            //     child: Container(
            //       color: Colors.blue,
            //       height: 100,
            //       width: 200,
            //       child: const Center(
            //         child: Text(
            //           "SecondaryTap",
            //           style: TextStyle(
            //             fontSize: 28,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            GestureDetector(
              onTertiaryTapDown: (TapDownDetails details) {
                print('-----onTertiaryTapDown---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              onTertiaryTapCancel: () {
                print('-----onTertiaryTapCancel---------');
              },
              onTertiaryTapUp: (TapUpDetails details) {
                print('-----onTertiaryTapUp---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              child: Center(
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text(
                      "Tertiary Tap",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onDoubleTapDown: (TapDownDetails details) {
                print('-----onDoubleTapDown---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              onDoubleTap: () {
                print('-----onDoubleTap---------');
              },
              onDoubleTapCancel: () {
                print('-----onDoubleTapCancel---------');
              },
              child: Center(
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text(
                      "Double Tap",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onLongPressDown: (LongPressDownDetails details) {
                print('-----onLongPressDown---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              onLongPressEnd: (LongPressEndDetails details) {
                print('-----onLongPressEnd---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベント終了時の速度---${details.velocity}------');
              },
              onLongPress: () {
                print('-----onLongPress---------');
              },
              onLongPressStart: (LongPressStartDetails details) {
                print('-----onLongPressStart---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
              },
              onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
                print('-----onLongPressMoveUpdate---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----移動の絶対偏移値---${details.offsetFromOrigin}------');
                print('-----移動の相対偏移値---${details.localOffsetFromOrigin}------');
              },
              onLongPressUp: () {
                print('-----onLongPressUp---------');
              },
              onLongPressCancel: () {
                print('-----onLongPressCancel---------');
              },
              child: Center(
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text(
                      "Long Press",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onPanDown: (DragDownDetails details) {
                print('-----onPanDown---------');
                print('-----タッチポイントからWidget左上の相対偏移値---${details.localPosition}------');
                print('-----タッチポイントから設備スクリーン左上の相対偏移値---${details.globalPosition}------');
              },
              onPanEnd: (DragEndDetails details) {
                print('-----onLongPressEnd---------');
                print('-----移動終了時の速度---${details.velocity}------');
                print('-----移動方向の初期速度---${details.primaryVelocity}------');
              },
              onPanStart: (DragStartDetails details) {
                print('-----onPanStart---------');
                print('-----ドラッグ開始のタイムスタンプ---${details.sourceTimeStamp}------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              onPanUpdate: (DragUpdateDetails details) {
                print('-----onLongPressMoveUpdate---------');
                print('-----移動時のタイムスタンプ---${details.sourceTimeStamp}------');
                print('-----毎回移動更新の偏移値---${details.delta}------');
                print('-----移動方向の初期偏移値---${details.primaryDelta}------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');

                if (panHeight > details.delta.dy.abs() + 20 || details.delta.dy > 0) {
                  setState(() {
                    panHeight = panHeight + details.delta.dy;
                  });
                }
              },
              onPanCancel: () {
                print('-----onPanCancel---------');
              },
              child: Center(
                child: Container(
                  color: Colors.blue,
                  height: panHeight,
                  width: 200,
                  child: const Center(
                    child: Text(
                      "Pan",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
