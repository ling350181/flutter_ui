import 'package:flutter/material.dart';
import 'package:flutter_ui/custom_scrollview/custom_sliver_header_delegate.dart';

class SliverPersistentHeaderPage extends StatelessWidget {
  const SliverPersistentHeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          buildHeader(1),
          buildList(),
          buildHeader(2),
          buildList(),
        ],
      ),
    );
  }

  Widget buildHeader(int tag) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomSliverHeaderDelegate(
        minHeight: 50.0,
        maxHeight: 100.0,
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text('SliverPersistentHeader $tag'),
          ),
        ),
      ),
    );
  }

  Widget buildList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            title: Text('List 1 - Item $index'),
          );
        },
        childCount: 20,
      ),
    );
  }
}
