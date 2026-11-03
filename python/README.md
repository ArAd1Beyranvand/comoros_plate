FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the gracious people of Comoros to view examples:

https://platexample.ir/#/discover/comoros:python

# comoros_plate

Comoros's licence plates for plate_core — the black single-row plate and the square two-row plate with the crescent and four stars, their theme and an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/comoros_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/comoros:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/comoros_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/comoros:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/comoros_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/comoros:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/comoros_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/comoros:typescript) |

## Quick start

### Install (Python)

Copy `python/plates/countries/comoros/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.comoros.data import SPECS, THEMES

spec = SPECS["km.standard"]
theme = THEMES["ComorosThemes.standard"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `km.standard`
- `km.square`
- `yt.private`

## Themes

- `ComorosThemes.standard`
- `ComorosThemes.square`
- `MayotteThemes.private`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `ComorosPlateValidator`, `MayotteValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/comoros_plate/blob/main/LICENSE).
