package plates.countries.comoros

import plates.core.validators.PlateCheck
import plates.core.validators.RuledPlateValidator

/** Judges a `ComorosPlates` value: three or four digits, a letter and two digits (`1284 A 73`). Reports, never bars a keystroke. */
class ComorosPlateValidator : RuledPlateValidator() {
    override val checks = listOf(
        PlateCheck("number", "[0-9]{3,4}", "The number is three or four digits."),
        PlateCheck("series", "[A-Z]", "The series is one letter."),
        PlateCheck("code", "[0-9]{2}", "The code is two digits."),
    )
}
