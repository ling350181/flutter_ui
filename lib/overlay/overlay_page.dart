import 'package:flutter/material.dart';

class OverlayPage extends StatelessWidget {
  OverlayPage({Key? key}) : super(key: key);

  OverlayEntry? _entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (BuildContext ctx) => Column(
                children: [
                  TextButton(
                    onPressed: () {
                      insertEntry(ctx);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      child: const Text(
                        "overlay",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      removeEntry();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      child: const Text(
                        "remove overlay",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void insertEntry(BuildContext context) {
    removeEntry();
    Offset targetOffset = Offset.zero;
    RenderObject? renderObject = context.findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      targetOffset = renderObject.localToGlobal(Offset.zero);
    }
    final OverlayState? overlayState = Overlay.of(context);
    if (overlayState == null) return;

    // OverlayEntryの作成
    _entry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        width: 50,
        height: 50,
        left: targetOffset.dx,
        top: targetOffset.dy - 50,
        child: GestureDetector(
          onTap: removeEntry,
          child: SizedBox(
            height: 50,
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
    // OverlayEntryのinsert
    overlayState.insert(_entry!);
  }

  void removeEntry() {
    if (_entry != null) {
      _entry!.remove();
      _entry = null;
    }
  }
}
