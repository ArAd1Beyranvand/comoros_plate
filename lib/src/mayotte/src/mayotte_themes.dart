import 'package:plate_core/plate_core.dart';

import 'mayotte_colors.dart';

/// Black on white, framed in the ink. The frame is 2.5 of 110 thick (0.0227)
/// as on French plates; the radius is estimated, not measured.
abstract final class MayotteThemes {
  static final PlateTheme private = PlateTheme.monochrome(
    field: MayotteColors.white,
    ink: MayotteColors.black,
    inactive: MayotteColors.inactive,
    borderWidthRatio: 0.0227,
    plateRadiusRatio: 0.055,
  );
}
