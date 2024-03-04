import 'package:flutter/material.dart';

class ColorSelectItem extends StatefulWidget {
  /// 選択できる色
  final List<Color> colors;

  /// 選択イベント
  final Function(Color color) onSelect;

  final Color defaultColor;

  const ColorSelectItem({
    Key? key,
    required this.colors,
    required this.onSelect,
    this.defaultColor = Colors.black,
  }) : super(key: key);

  @override
  State<ColorSelectItem> createState() => _ColorSelectItemState();
}

class _ColorSelectItemState extends State<ColorSelectItem> {
  late Color _activeColor;
  @override
  void initState() {
    super.initState();
    _activeColor = widget.defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 70,
        color: Colors.white,
        child: Wrap(
          spacing: 10,
          children: widget.colors
              .map((e) => GestureDetector(
                    onTap: () {
                      _activeColor = e;
                      widget.onSelect(e);
                      setState(() {});
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _activeColor == e ? Colors.blue : Colors.blue.withAlpha(1),
                        ),
                      ),
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: e,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
