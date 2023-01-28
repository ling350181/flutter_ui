import 'package:flutter/material.dart';
import 'package:flutter_ui/mult_child/row_axis_align_page.dart';
import 'package:flutter_ui/mult_child/row_cross_axis_align_page.dart';
import 'package:flutter_ui/mult_child/row_main_axis_size_page.dart';
import 'package:flutter_ui/mult_child/wrap_alignment_page.dart';
import 'package:flutter_ui/mult_child/wrap_cross_axis_alignment_page.dart';
import 'package:flutter_ui/mult_child/wrap_direction_page.dart';
import 'package:flutter_ui/mult_child/wrap_run_alignment_page.dart';
import 'package:flutter_ui/mult_child/wrap_text_direction_page.dart';
import 'package:flutter_ui/mult_child/wrap_vertical_direction_page.dart';

class MultChildrenPage extends StatelessWidget {
  const MultChildrenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('複数子Widget'),
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
                    builder: (context) => const RowAxisAlign(),
                  ),
                );
              },
              child: const Text("Row MainAxisAlignment"),
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
                      builder: (context) => const RowMainAxisSizePage(),
                    ),
                  );
                },
                child: const Text("Row MaxAxiSize"),
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
                      builder: (context) => const RowCrossAxisAlignPage(),
                    ),
                  );
                },
                child: const Text("Row CrossAxisAlignment"),
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
                      builder: (context) => const WrapDirectionPage(),
                    ),
                  );
                },
                child: const Text("Wrap direction"),
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
                      builder: (context) => const WrapAlignmentPage(),
                    ),
                  );
                },
                child: const Text("Wrap alignment"),
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
                      builder: (context) => const WrapRunAlignmentPage(),
                    ),
                  );
                },
                child: const Text("Wrap runAlignment"),
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
                      builder: (context) => const WrapCrossAxisAlignmentPage(),
                    ),
                  );
                },
                child: const Text("Wrap crossAxisAlignment"),
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
                      builder: (context) => const WrapTextDirectionPage(),
                    ),
                  );
                },
                child: const Text("Wrap textDirection"),
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
                      builder: (context) => const WrapVerticalDirectionPage(),
                    ),
                  );
                },
                child: const Text("Wrap verticalDirection"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
