import 'package:flutter/material.dart';

class ControllerBoundPage extends StatefulWidget {
  const ControllerBoundPage({Key? key}) : super(key: key);

  @override
  State<ControllerBoundPage> createState() => _ControllerBoundPageState();
}

class _ControllerBoundPageState extends State<ControllerBoundPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      lowerBound: 18,
      upperBound: 60,
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
              child: Text(
                "Animation",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: fontSize,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  double get fontSize => _ctrl.value;

  void _startAnim() {
    _ctrl.reset();
    _ctrl.forward();
  }
}
