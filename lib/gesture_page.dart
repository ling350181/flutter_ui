import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
  }
}
