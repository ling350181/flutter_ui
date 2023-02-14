import 'package:flutter/material.dart';
import 'package:flutter_ui/animation/controller_bound_page.dart';
import 'package:flutter_ui/animation/controller_value_page.dart';

class AnimationControllerPage extends StatelessWidget {
  const AnimationControllerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationController'),
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
                    builder: (context) => const ControllerValuePage(),
                  ),
                );
              },
              child: const Text("value"),
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
                      builder: (context) => const ControllerBoundPage(),
                    ),
                  );
                },
                child: const Text("lowerBoundとupperBound"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
