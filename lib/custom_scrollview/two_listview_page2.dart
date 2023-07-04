import 'package:flutter/material.dart';

class TwoListViewPage2 extends StatelessWidget {
  const TwoListViewPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliverList listSliver = SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            title: Text('List 1 - Item $index'),
          );
        },
        childCount: 7,
      ),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [listSliver, listSliver],
      ),
    );
  }
}
