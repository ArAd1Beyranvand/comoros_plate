FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the gracious people of Comoros to view examples:

https://platexample.ir/#/discover/comoros

# comoros_plate

Comoros's licence plates for the `plate_core` library. Two designs, both silver on black: the single-row plate (`1284 A 73`, 520×110 mm) and the square two-row plate (`079 U` over `73`) with the crescent and four stars and `COMORES`. The island, government and diplomatic series are not implemented: no artwork for them was found.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  comoros_plate: ^0.1.0
```

## Use

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

## Contains

- `ComorosCountry` — country panel: `comoros`.
- `MayotteCountry` — country panel: `mayotte`.
- `ComorosPlates` — 2 plate specs: `standard`, `square`.
- `MayottePlates` — 1 plate spec: `private`.
- `ComorosThemes` — 2 themes: `standard`, `square`.
- `MayotteThemes` — 1 theme: `private`.
- `ComorosPlateValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `MayotteValidator` — advisory validator; flags the frame, never blocks a keystroke.

## Plates

Groups `prefix`, `number`, `suffix` and `department` — the SIV `AA-000-AA`
with the département `976` on the right band. The EU band and its `F` are
painted by the background and the panel; the Mayotte logo is a drawing decal
over a white box.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

