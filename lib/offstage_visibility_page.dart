import 'package:flutter/material.dart';

class OffstageVisibilityPage extends StatefulWidget {
  const OffstageVisibilityPage({Key? key}) : super(key: key);

  @override
  State<OffstageVisibilityPage> createState() => _OffstageVisibilityPageState();
}

class _OffstageVisibilityPageState extends State<OffstageVisibilityPage> {
  late bool _offstage;
  late bool _visibility;
  late bool _aniVisibility;
  late bool _repVisibility;
  late Decoration _decoration;
  late double _height;
  late Alignment _alignment;

  @override
  void initState() {
    _offstage = false;
    _visibility = true;
    _aniVisibility = true;
    _repVisibility = true;
    _resetAnim();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OffstageとVisibility'),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topCenter,
            color: Colors.yellow,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _offstage = !_offstage;
                    setState(() {});
                  },
                  child: const Text("Offstage: show/hide"),
                ),
                Offstage(
                  offstage: _offstage,
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.red,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _offstage = !_offstage;
                    setState(() {});
                  },
                  child: const Text("if: show/hide"),
                ),
                if (!_offstage)
                  const Icon(
                    Icons.ac_unit,
                    color: Colors.green,
                  ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.green,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _offstage = !_offstage;
                        _startAnim();
                        setState(() {});
                        print('表示／非表示');
                      },
                      child: const Text("Offstage: show/hide"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _resetAnim();
                        setState(() {});
                      },
                      child: const Text("Reset Anim"),
                    ),
                  ],
                ),
                Offstage(
                  offstage: _offstage,
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
                    onEnd: () {
                      print('アニメーション終了');
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.yellow,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _visibility = !_visibility;
                    setState(() {});
                  },
                  child: const Text("Visibility: show/hide"),
                ),
                Visibility(
                  visible: _visibility,
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.green,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _repVisibility = !_repVisibility;
                    setState(() {});
                  },
                  child: const Text("Visibility: replacement"),
                ),
                Visibility(
                  visible: _repVisibility,
                  replacement: const Icon(
                    Icons.access_alarm_outlined,
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.yellow,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _visibility = !_visibility;
                    setState(() {});
                  },
                  child: const Text("Visibilityスペース占有: show/hide"),
                ),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainInteractivity: true,
                  visible: _visibility,
                  child: GestureDetector(
                    onTap: () {
                      print("タップしました。");
                    },
                    child: const Icon(
                      Icons.ac_unit,
                      color: Colors.green,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.dangerous,
                      color: Colors.green,
                    ),
                    Text("参照アイコン"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.green,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _aniVisibility = !_aniVisibility;
                        _startAnim();
                        setState(() {});
                        print('表示／非表示');
                      },
                      child: const Text("Visibility: show/hide"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _resetAnim();
                        setState(() {});
                      },
                      child: const Text("Reset Anim"),
                    ),
                  ],
                ),
                Visibility(
                  visible: _aniVisibility,
                  maintainState: true,
                  maintainAnimation: true,
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
                    onEnd: () {
                      print('アニメーション終了');
                    },
                  ),
                ),
              ],
            ),
          ),
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
      _alignment = Alignment.center;
    });
  }

  void _resetAnim() {
    setState(() {
      _decoration = const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      );
      _height = 150;
      _alignment = Alignment.topLeft;
    });
  }
}
