import 'package:flutter/material.dart';

class PenSelectItem extends StatefulWidget {
  /// 筆の幅
  final List<double> numbers;

  final double defaultWidht;

  /// 選択イベント
  final Function(double width) onSelect;
  const PenSelectItem({
    Key? key,
    required this.numbers,
    required this.onSelect,
    this.defaultWidht = 1,
  }) : super(key: key);

  @override
  State<PenSelectItem> createState() => _PenSelectItemState();
}

class _PenSelectItemState extends State<PenSelectItem> {
  late double _activeWidth;
  @override
  void initState() {
    super.initState();
    _activeWidth = widget.defaultWidht;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 70,
        color: Colors.white,
        child: Wrap(
          spacing: 10,
          children: widget.numbers
              .map((e) => GestureDetector(
                    onTap: () {
                      _activeWidth = e;
                      widget.onSelect(e);
                      setState(() {});
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _activeWidth == e ? Colors.blue : Colors.blue.withAlpha(1),
                        ),
                      ),
                      child: Container(
                          width: 12,
                          height: e,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.black,
                          )),
                    ),
                  ))
              .toList(),
        ));
  }
}
