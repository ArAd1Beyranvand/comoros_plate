import 'package:plate_core/plate_core.dart';

/// Mayotte as a `PlateCountry`: the EU band, as on French plates. The `F`
/// beneath the stars is a label on the spec, so [captionLines] is empty.
abstract final class MayotteCountry {
  static const PlateCountry mayotte = PlateCountry.euroband(code: 'yt');
}
