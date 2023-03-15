import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  final double _startOpacity = 1;
  final double _endOpacity = 0;

  late double _opacity;

  @override
  void initState() {
    super.initState();
    _opacity = _startOpacity;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _startAnim,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                color: Colors.lightGreen,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: _opacity,
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startAnim() {
    setState(() {
      _opacity = _endOpacity;
    });
  }
}
