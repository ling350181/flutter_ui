import 'package:flutter/material.dart';
import 'package:flutter_ui/scroll/grid_sliver_fixed_cross_page.dart';
import 'package:flutter_ui/scroll/grid_sliver_max_cross_page.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スクロール'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                side: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GridSliverMaxCrossPage(),
                  ),
                );
              },
              child: const Text("SliverGridDelegateWithMaxCrossAxisExtent"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GridSliverFixedCrossPage(),
                    ),
                  );
                },
                child: const Text("SliverGridDelegateWithFixedCrossAxisCount"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
