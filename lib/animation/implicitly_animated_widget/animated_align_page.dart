import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  final Alignment startAlignment = Alignment.topCenter;
  final Alignment endAlignment = Alignment.bottomRight;

  late Alignment _alignment;

  @override
  void initState() {
    super.initState();
    _alignment = startAlignment;
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
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 2000),
                  alignment: _alignment,
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                    size: 25,
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
      _alignment = endAlignment;
    });
  }
}
