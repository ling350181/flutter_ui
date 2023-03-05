import 'package:flutter/material.dart';

class RotationTransitionPage extends StatefulWidget {
  const RotationTransitionPage({Key? key}) : super(key: key);

  @override
  State<RotationTransitionPage> createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage>
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
              child: RotationTransition(
                turns: _ctrl,
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
