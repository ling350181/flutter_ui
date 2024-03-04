import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/application/drawing_board/line_model.dart';

class PaintViewModel {
  final List<LineModel> _lines = [];

  Color _activeColor = Colors.black;

  double _activeWidth = 1;

  List<LineModel> get lines => _lines;

  double get activeWidth => _activeWidth;

  Color get activeColor => _activeColor;

  /// 描画中の線
  LineModel get activeLine {
    LineModel? lineModel = _lines.singleWhere(
      (element) => element.state == PaintState.doing,
      orElse: () => LineModel(state: PaintState.other),
    );
    return lineModel;
  }

  /// ペンを移動しながら、ポイントを追加する
  void pushPoint(Offset point) {
    if (activeLine.state != PaintState.doing) return;
    activeLine.points.add(point);
  }

  /// ペンの色や幅を選択する
  void renderPenColor(Color color) {
    _activeColor = color;
  }

  /// ペンの色や幅を選択する
  void renderPenWidth(double width) {
    _activeWidth = width;
  }

  /// ペンを離す瞬間、一回の描画を終了する
  /// ペンの一回移動／描画
  void doneLine() {
    if (activeLine.state != PaintState.doing) return;
    activeLine.setState(PaintState.done);
  }

  /// 描かれた線を全部消す
  void clear() {
    for (LineModel line in _lines) {
      line.points.clear();
    }
    _lines.clear();
  }

  /// 空列を削除
  void removeEmpty() {
    _lines.removeWhere((element) => element.points.isEmpty);
  }

  /// ペン押下時、線の集合をプッシュ
  /// その後、移動しながら、集合にポイントをプッシュする
  void initLineData() {
    LineModel line = LineModel(
      color: _activeColor,
      strokeWidth: _activeWidth,
    );
    _lines.add(line);
  }
}
