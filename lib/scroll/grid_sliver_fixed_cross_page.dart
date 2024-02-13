import 'package:flutter/material.dart';

class GridSliverFixedCrossPage extends StatefulWidget {
  const GridSliverFixedCrossPage({Key? key}) : super(key: key);

  @override
  State<GridSliverFixedCrossPage> createState() => _GridSliverFixedCrossPageState();
}

class _GridSliverFixedCrossPageState extends State<GridSliverFixedCrossPage> {
  final List<int> data = List.generate(60, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交差軸個数'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          children: data
              .map(
                (index) => Container(
                  alignment: Alignment.center,
                  color: Colors.blue.withOpacity((index % 10) * 0.1),
                  height: 56,
                  child: Text(
                    '$index',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              )
              .toList(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.5,
          ),
        ),
      ),
    );
  }
}
