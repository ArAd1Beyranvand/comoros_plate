import 'package:plate_core/plate_core.dart';

/// Judges a `ComorosPlates` value: three or four digits, a letter and two
/// digits (`1284 A 73`, `079 U 73`). Reports, never bars a keystroke. The shape
/// is read off the plates in the article and the photographs found; nothing
/// found says what the letter or the last two digits (`71` and `73` were
/// seen) stand for, so no allocation rules are checked.
class ComorosPlateValidator extends GatedPlateValidator {
  const ComorosPlateValidator();

  @override
  String get gateGroup => 'code';

  static const String reasonNumber = 'The number is three or four digits.';
  static const String reasonSeries = 'The series is one letter.';
  static const String reasonCode = 'The code is two digits.';

  static final RegExp _number = RegExp(r'^[0-9]{3,4}$');
  static final RegExp _series = RegExp(r'^[A-Z]$');
  static final RegExp _code = RegExp(r'^[0-9]{2}$');

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!_number.hasMatch(entry.group('number'))) {
      return const PlateValidation.invalid(reasonNumber);
    }
    if (!_series.hasMatch(entry.group('series'))) {
      return const PlateValidation.invalid(reasonSeries);
    }
    if (!_code.hasMatch(entry.group('code'))) {
      return const PlateValidation.invalid(reasonCode);
    }
    return const PlateValidation.valid();
  }
}
