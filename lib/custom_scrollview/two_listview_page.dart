import 'package:flutter/material.dart';

class TwoListViewPage extends StatelessWidget {
  const TwoListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('List 1 - Item $index'),
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('List 2 - Item $index'),
              );
            },
          ),
        ],
      ),
    );
  }
}
