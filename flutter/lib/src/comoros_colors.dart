import 'package:flutter/widgets.dart';

/// The colours of the Comorian plate, sampled from the article's
/// `Comoros_license_plate_graphic.png` (the clean artwork). The rear-plate
/// photograph is brighter on both counts — field `101010`, ink `DCD8D8` — which
/// is exposure, not a second livery, so both plates use the artwork's.
abstract final class ComorosColors {
  /// The face, `060606`: modal colour of the plate interior.
  static const Color field = Color(0xFF060606);

  /// The characters, `AFB0AA`: modal colour of the glyph pixels. A silver, not
  /// the white the article's prose says.
  static const Color ink = Color(0xFFAFB0AA);

  /// The rim, `B7BAB7`: the mean of its top, left and bottom edges, which the
  /// artwork bevels from `A3A5A1` to `C0C2C0`.
  static const Color frame = Color(0xFFB7BAB7);

  /// An empty slot's hint. Not measured; legible on black.
  static const Color inactive = Color(0xFF5C5C5C);
}
