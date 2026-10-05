import 'package:plate_core/plate_core.dart';

import 'comoros_colors.dart';

/// Comoros as a `PlateCountry`. Neither plate carries a flag panel: the
/// crescent, stars and `COMORES` are background and a label on the square
/// plate, so both specs set `noPanel`.
abstract final class ComorosCountry {
  static const PlateCountry comoros = PlateCountry(
    code: 'km',
    captionLines: <String>[],
    panelColor: ComorosColors.field,
    panelTextColor: ComorosColors.ink,
  );
}
