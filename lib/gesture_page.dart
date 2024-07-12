import 'package:flutter/material.dart';
import 'package:flutter_ui/application/drawing_board/drawing_board_page.dart';
import 'package:flutter_ui/application/drawing_board_pro/drawing_board_pro_page.dart';
import 'package:flutter_ui/application/parabola/parabola_gesture_page.dart';
import 'package:flutter_ui/gesture/gesture_detector_other_page.dart';
import 'package:flutter_ui/gesture/gesture_detector_page.dart';

class GesturePage extends StatelessWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ジェスチャー'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                side: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GestureDetectorPage(),
                  ),
                );
              },
              child: const Text("GestureDetector"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GestureDetectorOtherPage(),
                    ),
                  );
                },
                child: const Text("GestureDetector-1"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParabolaGesturePage(),
                    ),
                  );
                },
                child: const Text("応用編(放物線)"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DrawingBoardPage(),
                    ),
                  );
                },
                child: const Text("応用編(絵描きボード)"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DrawingBoardProPage(),
                    ),
                  );
                },
                child: const Text("応用編(絵描きボード改善版)"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
