import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  final Decoration startDecoration = const BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );

  final Decoration endDecoration = const BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  final Alignment startAlignment = Alignment.topLeft;
  final Alignment endAlignment = Alignment.center;

  final double startHeight = 150.0;
  final double endHeight = 100.0;

  late Decoration _decoration;
  late double _height;
  late Alignment _alignment;

  @override
  void initState() {
    super.initState();
    _decoration = startDecoration;
    _height = startHeight;
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
          child: AnimatedContainer(
            decoration: _decoration,
            height: _height,
            width: 300,
            alignment: _alignment,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.linear,
            child: const Icon(
              Icons.ac_unit,
              color: Colors.red,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }

  void _startAnim() {
    setState(() {
      _height = endHeight;
      _decoration = endDecoration;
      _alignment = endAlignment;
    });
  }
}
