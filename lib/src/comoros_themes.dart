import 'package:plate_core/plate_core.dart';

import 'comoros_colors.dart';

/// Silver ink on black in a silver rim. The two designs differ only in how
/// heavy the rim is and how round the corners are, so both come from one
/// helper.
abstract final class ComorosThemes {
  static PlateTheme _theme({required double borderWidthRatio, required double plateRadiusRatio}) =>
      PlateTheme(
        plateBackground: ComorosColors.field,
        plateBorder: ComorosColors.frame,
        ink: ComorosColors.ink,
        dividerColor: ComorosColors.ink,
        borderWidthRatio: borderWidthRatio,
        plateRadiusRatio: plateRadiusRatio,
        activeColor: ComorosColors.ink,
        inactiveColor: ComorosColors.inactive,
      );

  /// The single-row plate. The artwork's rim is 3-4 px of its 76, about 5.3 of
  /// the 110 canvas units, 0.048 of the height; the outer corner radius reads
  /// as about 10 units, 0.09.
  static final PlateTheme standard = _theme(borderWidthRatio: 0.048, plateRadiusRatio: 0.09);

  /// The square plate. Photographed, its rim is a hairline: about 2.4 of the
  /// 200 canvas units, 0.012 of the height; the corners are barely rounded,
  /// about 0.02.
  static final PlateTheme square = _theme(borderWidthRatio: 0.012, plateRadiusRatio: 0.02);
}
