import 'dart:ui';

class DashPath {
  /// 破線の点線長さ
  final double step = 5;

  /// 破線の余白
  final double space = 5;

  /// １つの破線組み合わせ長さ
  double get partLength => step + space;

  Path dashPath(Path target) {
    final PathMetrics pms = target.computeMetrics();

    final Path dest = Path();
    for (var pm in pms) {
      // 破線組合せセットの数
      final int count = pm.length ~/ partLength;
      for (int i = 0; i < count; i++) {
        // 実線部分
        dest.addPath(pm.extractPath(partLength * i, partLength * i + step), Offset.zero);
      }
      // 余った部分
      final double tail = pm.length % partLength;
      dest.addPath(pm.extractPath(pm.length - tail, pm.length), Offset.zero);
    }
    return dest;
  }
}
