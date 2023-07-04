import 'package:flutter/material.dart';
import 'package:flutter_ui/custom_scrollview/sliver_demo_page.dart';
import 'package:flutter_ui/custom_scrollview/two_listview_page.dart';
import 'package:flutter_ui/custom_scrollview/two_listview_page2.dart';

class CustomScrollViewPage extends StatelessWidget {
  const CustomScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
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
                    builder: (context) => const TwoListViewPage(),
                  ),
                );
              },
              child: const Text("2つListView"),
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
                      builder: (context) => const TwoListViewPage2(),
                    ),
                  );
                },
                child: const Text("2つListView2"),
              ),
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
                      builder: (context) => const SliverDemoPage(),
                    ),
                  );
                },
                child: const Text("Sliver Demo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
