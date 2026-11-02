"""Port of comoros_plate/lib/src/mayotte/src/mayotte_validators.dart."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import (
    GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length)


def _letters_ok(value: str) -> bool:
    return re.fullmatch(r"[A-HJ-NP-TV-Z]{2}", value) is not None and value != "SS"


class MayotteValidator(GatedPlateValidator):
    gate_group = "number"

    REASON_PREFIX = "The prefix is two letters (no I, O, U or SS)."
    REASON_NUMBER = "The number is three digits, 001–999."
    REASON_SUFFIX = "The suffix is two letters (no I, O, U or SS)."
    REASON_DEPARTMENT = "The département code is 976."

    DEPARTMENT = "976"

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not _letters_ok(entry.group("prefix")):
            return PlateValidation.invalid(self.REASON_PREFIX)
        number = entry.group("number")
        if not is_digits_of_length(number, 3) or number == "000":
            return PlateValidation.invalid(self.REASON_NUMBER)
        if not _letters_ok(entry.group("suffix")):
            return PlateValidation.invalid(self.REASON_SUFFIX)
        code = entry.group("department")
        if code and code != self.DEPARTMENT:
            return PlateValidation.invalid(self.REASON_DEPARTMENT)
        return PlateValidation.valid()
