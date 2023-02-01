import 'package:flutter/material.dart';
import 'package:flutter_ui/paint/paint_anti_alias_page.dart';
import 'package:flutter_ui/paint/paint_blend_mode_page.dart';
import 'package:flutter_ui/paint/paint_stroke_cap_page.dart';
import 'package:flutter_ui/paint/paint_stroke_join_page.dart';
import 'package:flutter_ui/paint/paint_stroke_miter_limit_page.dart';

class PaintPage extends StatelessWidget {
  const PaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paint'),
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
                    builder: (context) => const PaintAntiAliasPage(),
                  ),
                );
              },
              child: const Text("Paint isAntiAlias"),
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
                      builder: (context) => const PaintStrokeCapPage(),
                    ),
                  );
                },
                child: const Text("Paint StrokeCap"),
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
                      builder: (context) => const PaintStrokeJoinPage(),
                    ),
                  );
                },
                child: const Text("Paint StrokeJoin"),
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
                      builder: (context) => const PaintStrokeMiterLimitPage(),
                    ),
                  );
                },
                child: const Text("Paint StrokeMiterLimit"),
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
                      builder: (context) => const PaintBlendModePage(),
                    ),
                  );
                },
                child: const Text("Paint BlendMode"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
