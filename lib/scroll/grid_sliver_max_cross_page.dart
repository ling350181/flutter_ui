import 'package:flutter/material.dart';

class GridSliverMaxCrossPage extends StatefulWidget {
  const GridSliverMaxCrossPage({Key? key}) : super(key: key);

  @override
  State<GridSliverMaxCrossPage> createState() => _GridSliverMaxCrossPageState();
}

class _GridSliverMaxCrossPageState extends State<GridSliverMaxCrossPage> {
  final List<int> data = List.generate(60, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交差軸最大値'),
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
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            childAspectRatio: 2,
          ),
        ),
      ),
    );
  }
}
