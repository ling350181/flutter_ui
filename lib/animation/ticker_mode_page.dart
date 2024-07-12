import 'package:flutter/material.dart';

class TickModePage extends StatefulWidget {
  const TickModePage({Key? key}) : super(key: key);

  @override
  State<TickModePage> createState() => _TickModePageState();
}

class _TickModePageState extends State<TickModePage> {
  late Decoration _decoration;
  late double _height;
  late Alignment _alignment;
  late bool _animated;

  @override
  void initState() {
    _resetAnim();
    _animated = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TickerMode'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text("TickerMode開閉"),
                  Switch(
                    value: _animated,
                    onChanged: (value) {
                      _animated = !_animated;
                      setState(() {});
                    },
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  _startAnim();
                },
                child: const Text("start Anim"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  onPressed: () {
                    _resetAnim();
                  },
                  child: const Text("reset Anim"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedContainer(
                  decoration: _decoration,
                  height: _height,
                  width: 150,
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.linear,
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                    size: 25,
                  ),
                  onEnd: () {
                    print('通常アニメーション終了');
                  },
                ),
              ),
              TickerMode(
                enabled: _animated,
                child: AnimatedContainer(
                  decoration: _decoration,
                  height: _height,
                  width: 150,
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.linear,
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                    size: 25,
                  ),
                  onEnd: () {
                    print('TickerModeアニメーション終了');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _startAnim() {
    setState(() {
      _height = 100;
      _decoration = const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      );
      _alignment = Alignment.bottomRight;
    });
  }

  void _resetAnim() {
    setState(() {
      _decoration = const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      );
      _height = 250;
      _alignment = Alignment.topLeft;
    });
  }
}
