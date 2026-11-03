FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the gracious people of Comoros to view examples:

https://platexample.ir/#/discover/comoros:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/comoros/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.comoros.country

val spec = country.specs["km.standard"]
println(country.pkg)
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

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`ComorosPlateValidator`, `MayotteValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/comoros_plate/blob/main/LICENSE).
