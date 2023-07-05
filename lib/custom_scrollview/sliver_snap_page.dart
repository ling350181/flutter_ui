import 'package:flutter/material.dart';

class SliverSnapPage extends StatelessWidget {
  const SliverSnapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            expandedHeight: 140.0,
            floating: true,
            snap: true,
            title: Text(
              'Demo',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "asset/images/flutter.jpeg",
                //fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    title: Text('List 1 - Item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
