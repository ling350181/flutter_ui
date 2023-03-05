import 'package:flutter/material.dart';
import 'package:flutter_ui/animation/animated_widget/scale_transition_page.dart';

class AnimatedWidgetPage extends StatelessWidget {
  const AnimatedWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedWidget'),
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
                    builder: (context) => const ScaleTransitionPage(),
                  ),
                );
              },
              child: const Text("ScaleTransition"),
            ),
          ],
        ),
      ),
    );
  }
}
