import 'package:flutter/material.dart';

class SliverToBoxAdapterPage extends StatelessWidget {
  const SliverToBoxAdapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            expandedHeight: 140.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: Text(
                'Demo',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              background: Image.asset(
                "asset/images/flutter.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: Container(
                color: Colors.yellow,
                child: const Text("SliverToBoxAdapter"),
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
