import 'package:comoros_plate/comoros_plate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateValidation judge(PlateSpec spec, String value) =>
      const ComorosPlateValidator().validate(PlateEntry(spec: spec, values: value.split('')));

  test('accepts the single-row plate', () {
    expect(judge(ComorosPlates.standard, '1284A73').isValid, isTrue);
  });

  test('accepts the square plate', () {
    expect(judge(ComorosPlates.square, '079U73').isValid, isTrue);
  });

  test('rejects a digit in the series', () {
    expect(judge(ComorosPlates.standard, '1284573').isValid, isFalse);
  });

  test('rejects a letter in the code', () {
    expect(judge(ComorosPlates.square, '079U7X').isValid, isFalse);
  });

  test('slot counts follow the digit counts', () {
    expect(ComorosPlates.standard.slotCount, 7);
    expect(ComorosPlates.square.slotCount, 6);
  });

  test('every spec is consistent', () {
    for (final spec in ComorosPlates.all) {
      expect(debugValidateSpec(spec), isTrue);
    }
  });
}
