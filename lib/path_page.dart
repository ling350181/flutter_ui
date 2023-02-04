import 'package:flutter/material.dart';
import 'package:flutter_ui/path/path_moveto_page.dart';

class PathPage extends StatelessWidget {
  const PathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path'),
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
                    builder: (context) => const PathMoveToPage(),
                  ),
                );
              },
              child: const Text("Path moveTo"),
            ),
          ],
        ),
      ),
    );
  }
}
