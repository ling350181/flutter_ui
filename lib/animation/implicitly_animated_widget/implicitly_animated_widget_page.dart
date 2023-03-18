import 'package:flutter/material.dart';
import 'package:flutter_ui/animation/implicitly_animated_widget/animated_align_page.dart';
import 'package:flutter_ui/animation/implicitly_animated_widget/animated_container_page.dart';
import 'package:flutter_ui/animation/implicitly_animated_widget/animated_opacity_page.dart';
import 'package:flutter_ui/animation/implicitly_animated_widget/tween_animation_builder_page.dart';

class ImplicitlyAnimatedWidgetPage extends StatelessWidget {
  const ImplicitlyAnimatedWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImplicitlyAnimatedWidget'),
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
                    builder: (context) => const AnimatedContainerPage(),
                  ),
                );
              },
              child: const Text("AnimatedContainer"),
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
                      builder: (context) => const AnimatedAlignPage(),
                    ),
                  );
                },
                child: const Text("AnimatedAlign"),
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
                      builder: (context) => const AnimatedOpacityPage(),
                    ),
                  );
                },
                child: const Text("AnimatedOpacity"),
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
                      builder: (context) => const TweenAnimationBuilderPage(),
                    ),
                  );
                },
                child: const Text("TweenAnimationBuilder"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
