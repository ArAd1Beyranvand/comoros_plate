"""Port of comoros_plate/lib/src/comoros_validators.dart. Hand-ported; codegen never overwrites this file."""

import re

from plates.core.validators.plate_validator import PlateCheck, RuledPlateValidator


_NUMBER = re.compile(r"[0-9]{3,4}")
_SERIES = re.compile(r"[A-Z]")
_CODE = re.compile(r"[0-9]{2}")


class ComorosPlateValidator(RuledPlateValidator):
    checks = (
        PlateCheck("number", r"[0-9]{3,4}", "The number is three or four digits."),
        PlateCheck("series", r"[A-Z]", "The series is one letter."),
        PlateCheck("code", r"[0-9]{2}", "The code is two digits."),
    )
