import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'comoros_alphabets.dart';
import 'comoros_clippers.dart';
import 'comoros_country.dart';

/// Where the ink sits on the single-row plate, in plate coordinates.
///
/// Measured off `Comoros_license_plate_graphic.png` (350×185; the plate is
/// the 345×76 inside the page margin, aspect 4.54). The article documents
/// 520×110 mm (4.73), so that is the canvas and the artwork is scaled by 1.507
/// across and 1.447 down — it is drawn about 4% too tall.
///
/// * Ink: y 18.8..91.2 (72.4 tall, centre 55.0 — the plate's own middle).
/// * Number `1284`: `1` x 79.9..98.0, `2` 108.5..140.2, `8` 150.7..182.4,
///   `4` 192.9..223.1. The `2 8 4` centres 124.3, 166.6, 208.0 give a pitch of
///   41.85; the `1` is a narrow glyph and sits right of its cell, so the first
///   cell is centred at 124.3 - 41.85 = 82.45.
/// * Letter `A`: x 274.3..315.0, centre 294.7.
/// * Code `73`: `7` 369.3..399.4, `3` 403.9..437.1 — centres 384.3 and 420.5,
///   a tighter pitch of 36.2 than the number's.
///
/// **Under-height, accepted.** The reference glyph is 72.4 tall on a 110 canvas;
/// a slot's ink is about 51% of its box, so matching it would need a 141 box.
/// The box is the full 110, the tallest that stays inside once centred.
///
/// **Cells wider than their pitch.** A slot shrinks its glyph to fit the box's
/// width, and Roboto Bold at this height is 44.5 wide against a pitch of 41.85
/// and 36.2, so a box as wide as its pitch would cost ink height. The boxes are
/// as wide as the glyph instead; they overlap their neighbours by 3 and 9, and
/// the text is centred, so the ink does not move.
abstract final class _Standard {
  static const double width = 520;
  static const double height = 110;

  static const double numberPitch = 41.85;
  static const double numberFirstCentre = 82.45;
  static const int numberDigits = 4;
  static const double digitCell = 45;

  static const double letterCentre = 294.7;
  static const double letterCell = 56;

  static const double codePitch = 36.2;
  static const double codeFirstCentre = 384.3;
  static const int codeDigits = 2;
}

/// Where the ink sits on the square two-row plate.
///
/// Measured off `Comoros_rear_license_plate.jpg`, the article's only photo of
/// it (246×189), after **rectifying** it. The photograph is skewed: the top
/// and bottom edges run up to the right at 9.6° and 10.9° while the sides stay
/// upright, so a rotation alone does not square it. The four corners were
/// fitted to the rim's edge lines and the plate warped to 912×560, aspect
/// 1.63. The article gives no size for this plate, so the canvas is that
/// proportion, 326×200 — both axes then scale by 2.80.
///
/// * Row one, `079 U`: ink y 12.2..99.4 (centre 55.8). Digit centres 72.0,
///   124.2, 175.7 — pitch 51.85; `U` centred at 252.9, a gap of 1.5 cells.
/// * Row two, `73`: ink y 101.5..189.8 (centre 145.65). `7` 129.4..161.2,
///   `3` 181.2..217.0 — centres 145.3 and 199.1, pitch 53.8.
/// * Crescent: the outer disc is centred (60.9, 138.6), radius 39.8; the inner
///   disc that cuts it is centred (77.4, 139.2), radius 41.9. Fitted to the
///   crescent's two edges row by row (y 104..176), not eyeballed.
/// * Stars: four, points up, centred x 58.5 and y 112.4, 130.1, 147.9, 165.6
///   (a fitted pitch of 17.73). The photograph's measure 9.3 wide by 10.0 tall,
///   but it is blurred; a circumradius of 5.2 rendered 8.8 by 8.1, because the
///   thin points anti-alias away, so it is 5.7, which renders 9.4 by 9.4.
/// * `COMORES`: ink x 16.1..77.6, y 178.0..188.7 (10.7 tall). Roboto Bold is
///   wider than the plate's lettering: at the reference height it is 71.5 wide
///   against 61.5, so the glyph is a little short instead, about 10.0 tall by
///   67 wide.
///
/// **Under-height, accepted.** Both rows print a glyph about 87 tall on a 200
/// canvas, and a slot's ink is about 51% of its box, so the reference would
/// need a 170 box. Centred on each row's ink it can be 108 at most before it
/// leaves the canvas, so the ink is about 56 (65% of the reference). The two
/// rows' boxes overlap by 18, where a tap goes to the lower row.
///
/// **Not drawn.** The two screw holes and the faint inner rim.
abstract final class _Square {
  static const double width = 326;
  static const double height = 200;

  static const double rowHeight = 108;
  static const double rowOneTop = 1.8;
  static const double rowTwoTop = 91.65;

  static const double numberPitch = 51.85;
  static const double numberFirstCentre = 72.0;
  static const int numberDigits = 3;

  static const double letterCentre = 252.9;

  static const double codePitch = 53.8;
  static const double codeFirstCentre = 145.3;
  static const int codeDigits = 2;

  /// The leaf the crescent and stars are painted in: the crescent's bounding
  /// box (x 21.1..63.9, y 98.9..178.4), a little loose. Everything the clipper
  /// holds is relative to its top-left corner.
  static const double emblemLeft = 21;
  static const double emblemTop = 98.5;
  static const double emblemWidth = 43;
  static const double emblemHeight = 80;

  static const ComorosCrescentClipper emblem = ComorosCrescentClipper(
    outerCentre: Offset(39.9, 40.1),
    outerRadius: 39.8,
    innerCentre: Offset(56.4, 40.7),
    innerRadius: 41.9,
    stars: <Offset>[Offset(37.5, 13.9), Offset(37.5, 31.6), Offset(37.5, 49.4), Offset(37.5, 67.1)],
    starRadius: 5.7,
  );

  /// `COMORES` centred on x 46.85, y 183.35 (the ink's middle).
  static const PlateBox caption = PlateBox(11.85, 173.35, 70, 20);
  static const double captionGlyph = 19.5;
}

abstract final class ComorosPlates {
  /// `1284 A 73` on one row, 520×110. Pair with `ComorosThemes.standard`.
  static final PlateSpec standard = PlateSpec(
    id: 'km.standard',
    country: ComorosCountry.comoros,
    canvasWidth: _Standard.width,
    canvasHeight: _Standard.height,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    noPanel: true,
    slots: <PlateSlot>[
      ...plateRegister(
        alphabet: ComorosAlphabets.digits,
        count: _Standard.numberDigits,
        left: _Standard.numberFirstCentre - _Standard.digitCell / 2,
        top: 0,
        width: _Standard.digitCell,
        height: _Standard.height,
        pitch: _Standard.numberPitch,
      ),
      PlateSlot(
        alphabet: ComorosAlphabets.letters,
        box: PlateBox(
          _Standard.letterCentre - _Standard.letterCell / 2,
          0,
          _Standard.letterCell,
          _Standard.height,
        ),
      ),
      ...plateRegister(
        alphabet: ComorosAlphabets.digits,
        count: _Standard.codeDigits,
        left: _Standard.codeFirstCentre - _Standard.digitCell / 2,
        top: 0,
        width: _Standard.digitCell,
        height: _Standard.height,
        pitch: _Standard.codePitch,
      ),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0, 1, 2, 3], key: 'number'),
      PlateTextGroup(<int>[4], key: 'series'),
      PlateTextGroup(<int>[5, 6], key: 'code'),
    ],
  );

  /// `079 U` over `73`, 326×200, with the crescent, four stars and `COMORES`
  /// at the lower left. Pair with `ComorosThemes.square`.
  static final PlateSpec square = PlateSpec(
    id: 'km.square',
    country: ComorosCountry.comoros,
    canvasWidth: _Square.width,
    canvasHeight: _Square.height,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    noPanel: true,
    background: PlateSection.columns(<PlatePart>[
      const PlatePart(PlateSection.plain, end: _Square.emblemLeft),
      PlatePart(
        PlateSection.rows(<PlatePart>[
          const PlatePart(PlateSection.plain, end: _Square.emblemTop),
          PlatePart(
            const PlateSection.fill(PlateFill.divider, shape: _Square.emblem),
            end: _Square.emblemTop + _Square.emblemHeight,
          ),
          const PlatePart(PlateSection.plain),
        ]),
        end: _Square.emblemLeft + _Square.emblemWidth,
      ),
      const PlatePart(PlateSection.plain),
    ]),
    labels: const <PlateLabel>[
      PlateLabel(text: 'COMORES', box: _Square.caption, glyphHeight: _Square.captionGlyph),
    ],
    slots: <PlateSlot>[
      ...plateRegister(
        alphabet: ComorosAlphabets.digits,
        count: _Square.numberDigits,
        left: _Square.numberFirstCentre - _Square.numberPitch / 2,
        top: _Square.rowOneTop,
        width: _Square.numberPitch,
        height: _Square.rowHeight,
      ),
      PlateSlot(
        alphabet: ComorosAlphabets.letters,
        box: PlateBox(
          _Square.letterCentre - _Square.numberPitch / 2,
          _Square.rowOneTop,
          _Square.numberPitch,
          _Square.rowHeight,
        ),
      ),
      ...plateRegister(
        alphabet: ComorosAlphabets.digits,
        count: _Square.codeDigits,
        left: _Square.codeFirstCentre - _Square.codePitch / 2,
        top: _Square.rowTwoTop,
        width: _Square.codePitch,
        height: _Square.rowHeight,
      ),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0, 1, 2], key: 'number'),
      PlateTextGroup(<int>[3], key: 'series'),
      PlateTextGroup(<int>[4, 5], key: 'code'),
    ],
  );

  static final List<PlateSpec> all = <PlateSpec>[standard, square];
}
