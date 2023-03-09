import 'package:flutter/material.dart';

class AlignTransitionPage extends StatefulWidget {
  const AlignTransitionPage({Key? key}) : super(key: key);

  @override
  State<AlignTransitionPage> createState() => _AlignTransitionPageState();
}

class _AlignTransitionPageState extends State<AlignTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Alignment> animation;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    animation = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
    ).chain(CurveTween(curve: Curves.ease)).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _startAnim,
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.lightGreen,
                    child: AlignTransition(
                      alignment: animation,
                      child: const Icon(
                        Icons.ac_unit,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _startAnim() {
    _ctrl.reset();
    _ctrl.forward();
  }
}
