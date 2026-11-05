import { PlateCheck, RuledPlateValidator } from 'plate_core/core/validators/plate_validator';

/** Judges a `ComorosPlates` value: three or four digits, a letter and two
 * digits (`1284 A 73`, `079 U 73`). Reports, never bars a keystroke. The shape
 * is read off the plates in the article and the photographs found; nothing
 * found says what the letter or the last two digits (`71` and `73` were
 * seen) stand for, so no allocation rules are checked. */
export class ComorosPlateValidator extends RuledPlateValidator {
  readonly checks = [
    new PlateCheck('number', '[0-9]{3,4}', 'The number is three or four digits.'),
    new PlateCheck('series', '[A-Z]', 'The series is one letter.'),
    new PlateCheck('code', '[0-9]{2}', 'The code is two digits.'),
  ];
}
