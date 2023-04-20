import 'package:flutter/material.dart';

class GestureDetectorPage extends StatelessWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('-----tap---------');
              },
              onTapDown: (TapDownDetails details) {
                print('-----onTapDown---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              onTapCancel: () {
                print('-----onTapCancel---------');
              },
              onTapUp: (TapUpDetails details) {
                print('-----onTapUp---------');
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
                      "on tap",
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
              onSecondaryTap: () {
                print('-----onSecondaryTap---------');
              },
              onSecondaryTapDown: (TapDownDetails details) {
                print('-----onSecondaryTapDown---------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              onSecondaryTapCancel: () {
                print('-----onSecondaryTapCancel---------');
              },
              onSecondaryTapUp: (TapUpDetails details) {
                print('-----onSecondaryTapUp---------');
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
                      "SecondaryTap",
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
          ],
        ),
      ),
    );
  }
}
