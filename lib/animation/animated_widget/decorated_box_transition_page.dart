import 'package:flutter/material.dart';

class DecoratedBoxTransitionPage extends StatefulWidget {
  const DecoratedBoxTransitionPage({Key? key}) : super(key: key);

  @override
  State<DecoratedBoxTransitionPage> createState() => _DecoratedBoxTransitionPageState();
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Decoration> animation;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    animation = DecorationTween(
        begin: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.green,
                blurRadius: 5,
                spreadRadius: 2,
              )
            ]),
        end: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(60)),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.blue,
                blurRadius: 10,
                spreadRadius: 0,
              )
            ])).animate(_ctrl);
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
                  DecoratedBoxTransition(
                    decoration: animation,
                    child: const Icon(
                      Icons.ac_unit,
                      color: Colors.red,
                      size: 80,
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
