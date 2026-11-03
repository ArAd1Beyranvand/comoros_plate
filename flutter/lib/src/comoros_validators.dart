import 'package:plate_core/plate_core.dart';

/// Judges a `ComorosPlates` value: three or four digits, a letter and two
/// digits (`1284 A 73`, `079 U 73`). Reports, never bars a keystroke. The shape
/// is read off the plates in the article and the photographs found; nothing
/// found says what the letter or the last two digits (`71` and `73` were
/// seen) stand for, so no allocation rules are checked.
class ComorosPlateValidator extends RuledPlateValidator {
  const ComorosPlateValidator();

  static const String reasonNumber = 'The number is three or four digits.';
  static const String reasonSeries = 'The series is one letter.';
  static const String reasonCode = 'The code is two digits.';

  @override
  List<PlateCheck> get checks => const <PlateCheck>[
    PlateCheck('number', r'[0-9]{3,4}', reasonNumber),
    PlateCheck('series', r'[A-Z]', reasonSeries),
    PlateCheck('code', r'[0-9]{2}', reasonCode),
  ];
}
