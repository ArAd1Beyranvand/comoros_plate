FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the gracious people of Comoros to view examples:

https://platexample.ir/#/discover/comoros:flutter

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

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  comoros_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:comoros_plate/comoros_plate.dart';

PlateCanvas(
  spec: ComorosPlates.standard,
  theme: ComorosThemes.standard,
  validator: const ComorosPlateValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `ComorosPlates.standard` — id `km.standard`
- `ComorosPlates.square` — id `km.square`

## Themes

- `ComorosThemes.standard`
- `ComorosThemes.square`

## Change it

`PlateCanvas` takes `spec:` (an entry of `ComorosPlates`) and `theme:` (an entry of `ComorosThemes`). Set `validator:` to `ComorosPlateValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `ComorosCountry` — the country panel.
- `ComorosPlateValidator` — the plate validator.

## Plates

Groups `prefix`, `number`, `suffix` and `department` — the SIV `AA-000-AA`
with the département `976` on the right band. The EU band and its `F` are
painted by the background and the panel; the Mayotte logo is a drawing decal
over a white box.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/comoros_plate/blob/main/LICENSE).
