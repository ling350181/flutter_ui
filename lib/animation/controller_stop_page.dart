import 'dart:async';

import 'package:flutter/material.dart';

class ControllerStopPage extends StatefulWidget {
  const ControllerStopPage({Key? key}) : super(key: key);

  @override
  _ControllerStopPageState createState() => _ControllerStopPageState();
}

class _ControllerStopPageState extends State<ControllerStopPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      value: 0.4,
      vsync: this,
      duration: animDuration,
      upperBound: 1,
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

  double get fontSize => 60 * _ctrl.value;

  void _startAnim() async {
    Timer(const Duration(milliseconds: 2000), _stop);
    print('start!---${DateTime.now().toIso8601String()}----------');
    await _ctrl.repeat(reverse: true);
  }

  void _stop() {
    _ctrl.stop();
    print('done!---${DateTime.now().toIso8601String()}----------');
  }
}
