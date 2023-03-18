import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilderPage> createState() => _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  late Tween<Alignment> tween;

  @override
  void initState() {
    tween = AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomRight);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.lightGreen,
              child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 2000),
                tween: tween,
                builder: (_, AlignmentGeometry alignment, child) {
                  return Align(
                    alignment: alignment,
                    child: const Icon(
                      Icons.ac_unit,
                      color: Colors.red,
                      size: 25,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
