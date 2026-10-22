import 'package:plate_core/plate_core.dart';

/// Judges a Mayotte SIV plate: two letters, three digits (001–999) and
/// two letters, with the département `976` on the right. The letters leave
/// out I, O and U, and the SS pair. Reports, never bars a keystroke.
class MayotteValidator extends GatedPlateValidator {
  const MayotteValidator();

  @override
  String get gateGroup => 'number';

  static const String reasonPrefix = 'The prefix is two letters (no I, O, U or SS).';
  static const String reasonNumber = 'The number is three digits, 001–999.';
  static const String reasonSuffix = 'The suffix is two letters (no I, O, U or SS).';
  static const String reasonDepartment = 'The département code is 976.';

  static const String department = '976';

  static final RegExp _letters = RegExp(r'^[A-HJ-NP-TV-Z]{2}$');

  @override
  PlateValidation judge(PlateEntry entry) {
    final String prefix = entry.group('prefix');
    if (!_letters.hasMatch(prefix) || prefix == 'SS') {
      return const PlateValidation.invalid(reasonPrefix);
    }
    final String number = entry.group('number');
    if (!isDigitsOfLength(number, 3) || number == '000') {
      return const PlateValidation.invalid(reasonNumber);
    }
    final String suffix = entry.group('suffix');
    if (!_letters.hasMatch(suffix) || suffix == 'SS') {
      return const PlateValidation.invalid(reasonSuffix);
    }
    final String code = entry.group('department');
    if (code.isNotEmpty && code != department) {
      return const PlateValidation.invalid(reasonDepartment);
    }
    return const PlateValidation.valid();
  }
}
