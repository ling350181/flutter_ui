import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/application/drawing_board/line_model.dart';

class PaintViewModel {
  final List<LineModel> _lines = [];

  List<LineModel> get lines => _lines;

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
    LineModel line = LineModel();
    _lines.add(line);
  }
}
