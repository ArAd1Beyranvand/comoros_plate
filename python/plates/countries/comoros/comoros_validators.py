"""Port of comoros_plate/lib/src/comoros_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import (
    GatedPlateValidator, PlateEntry, PlateValidation, PlateValidator, is_digits, is_digits_of_length, restriction_verdict)


_NUMBER = re.compile(r"[0-9]{3,4}")
_SERIES = re.compile(r"[A-Z]")
_CODE = re.compile(r"[0-9]{2}")


class ComorosPlateValidator(GatedPlateValidator):
    gate_group = "code"
    reason_number = "The number is three or four digits."
    reason_series = "The series is one letter."
    reason_code = "The code is two digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not _NUMBER.fullmatch(entry.group("number")):
            return PlateValidation.invalid(self.reason_number)
        if not _SERIES.fullmatch(entry.group("series")):
            return PlateValidation.invalid(self.reason_series)
        if not _CODE.fullmatch(entry.group("code")):
            return PlateValidation.invalid(self.reason_code)
        return PlateValidation.valid()
