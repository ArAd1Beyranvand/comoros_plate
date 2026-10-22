import 'dart:math' as math;

import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/widgets.dart';

/// A crescent and a column of five-pointed stars, as one region of a
/// background leaf: the crescent is the [outerRadius] disc less the
/// [innerRadius] disc, and each star points up. Every coordinate is in the
/// leaf's own box, so the leaf can sit anywhere on the plate.
class ComorosCrescentClipper extends CustomClipper<Path> {
  const ComorosCrescentClipper({
    required this.outerCentre,
    required this.outerRadius,
    required this.innerCentre,
    required this.innerRadius,
    required this.stars,
    required this.starRadius,
  });

  final Offset outerCentre;
  final double outerRadius;
  final Offset innerCentre;
  final double innerRadius;

  /// Each star's circumcentre; [starRadius] is centre to point.
  final List<Offset> stars;

  final double starRadius;

  @override
  Path getClip(Size size) {
    final Path path = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: outerCentre, radius: outerRadius)),
      Path()..addOval(Rect.fromCircle(center: innerCentre, radius: innerRadius)),
    );
    for (final Offset c in stars) {
      path.addPath(_star(c, starRadius), Offset.zero);
    }
    return path;
  }

  /// A regular pentagram: points alternate between [r] and the inner radius
  /// that keeps its edges straight, `r * sin(18°) / sin(54°)`.
  static Path _star(Offset c, double r) {
    final double inner = r * math.sin(math.pi / 10) / math.sin(3 * math.pi / 10);
    final Path p = Path();
    for (var i = 0; i < 10; i++) {
      final double radius = i.isEven ? r : inner;
      final double a = -math.pi / 2 + i * math.pi / 5;
      final Offset v = c + Offset(math.cos(a), math.sin(a)) * radius;
      i == 0 ? p.moveTo(v.dx, v.dy) : p.lineTo(v.dx, v.dy);
    }
    return p..close();
  }

  @override
  bool shouldReclip(ComorosCrescentClipper old) =>
      old.outerCentre != outerCentre ||
      old.outerRadius != outerRadius ||
      old.innerCentre != innerCentre ||
      old.innerRadius != innerRadius ||
      old.starRadius != starRadius ||
      !listEquals(old.stars, stars);
}
