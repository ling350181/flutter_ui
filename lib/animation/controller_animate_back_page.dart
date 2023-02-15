import 'package:flutter/material.dart';

class ControllerAnimateBackPage extends StatefulWidget {
  const ControllerAnimateBackPage({Key? key}) : super(key: key);

  @override
  _ControllerAnimateBackPageState createState() => _ControllerAnimateBackPageState();
}

class _ControllerAnimateBackPageState extends State<ControllerAnimateBackPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  final Duration animDuration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      value: 0.4,
      vsync: this,
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

  void _startAnim() {
    _ctrl.animateBack(
      1,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
