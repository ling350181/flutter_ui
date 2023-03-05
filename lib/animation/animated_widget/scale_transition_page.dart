import 'package:flutter/material.dart';

class ScaleTransitionPage extends StatefulWidget {
  const ScaleTransitionPage({Key? key}) : super(key: key);

  @override
  State<ScaleTransitionPage> createState() => _ScaleTransitionPageState();
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      lowerBound: 0.3,
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
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
              child: ScaleTransition(
                alignment: Alignment.centerLeft,
                scale: _ctrl,
                child: const Icon(
                  Icons.ac_unit,
                  color: Colors.red,
                  size: 60,
                ),
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
