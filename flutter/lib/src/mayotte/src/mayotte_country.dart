import 'package:plate_core/plate_core.dart';

import 'mayotte_colors.dart';

/// Mayotte as a `PlateCountry`: the EU band, as on French plates. The `F`
/// beneath the stars is a label on the spec, so [captionLines] is empty.
abstract final class MayotteCountry {
  static const PlateCountry mayotte = PlateCountry(
    code: 'yt',
    captionLines: <String>[],
    panelColor: MayotteColors.euroBlue,
    panelTextColor: MayotteColors.white,
    flagAspectRatio: 46 / 70.4,
    flag: EuropeanStars.band,
  );
}
