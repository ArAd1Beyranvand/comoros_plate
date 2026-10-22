import 'package:flutter/widgets.dart';

/// White, black and the band blue are the SIV plate's, from the French vector
/// artwork (`License_plate_of_France_AA-229-DB`): the only Mayotte picture
/// (worldlicenseplates.com sheet, 527 px wide) is colour-cast, its band reads
/// 0078D0 and its white E0E8F0. The logo colours are modal pixels of that
/// sheet's 20 px wide sticker, so they are approximate.
abstract final class MayotteColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color euroBlue = Color(0xFF003399);
  static const Color inactive = Color(0xFFB0B0B0);
  static const Color logoBlue = Color(0xFF2090C8);
  static const Color logoRed = Color(0xFFB82020);
  static const Color logoGrey = Color(0xFF606068);
}
