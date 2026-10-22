import 'dart:math';

import 'package:flutter/widgets.dart' show Color, EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'mayotte_colors.dart';
import 'mayotte_country.dart';

/// Where the ink sits, in plate units.
///
/// Mayotte uses French dies on the European 520×110 plate, so the geometry is
/// `france_plate`'s private plate: letters at pitch 47.3 centred 107.4, digits
/// at 47.5 centred 262, letters at 45.3 centred 413, hyphens at 172.5 and
/// 349.3, blue bands ending at 52 and starting at 470. Ink is about 55% of a
/// box and a box cannot leave the canvas, so the ~60 ink is 74% of the 81.5
/// reference. None of this was re-measured: the only Mayotte picture is a
/// 527 px sheet (worldlicenseplates.com, "203 Series (C)"), too small to
/// measure, but it shows the same layout: `CE-683-HR`, EU band, and a right
/// band with the regional sticker.
///
/// The sticker prints `97` small and stacked over a large `6`; it is modelled
/// as one three-digit field `976`, like French Guiana's, 36 tall in the 49
/// wide band. Above it a white box (France's 36.4×38.9 at x 475.8, y 10) holds
/// the Mayotte logo: `MAYOTTE` arched over a shield (blue over red, white
/// crescent) held by two grey seahorses. The drawing is a simplified shield
/// and crescent; the seahorses are two grey bars, not a trace.
///
/// Not drawn: the 1976–1989 `AMTE` plates and the 1990 black, white and yellow
/// `000 A 976` series, which are history, not current plates.
abstract final class _Layout {
  static const double width = 520, height = 110;
  static const double leftEnd = 52, rightStart = 470;

  static const double bandCx = 26.75;
  static const double panelWidth = 46, panelHeight = 70.4;
  static const double fTop = 65.5, fHeight = 22, fGlyph = 39, fWidth = 20;

  static const double logoLeft = 475.8, logoTop = 10;
  static const double logoWidth = 36.4, logoHeight = 38.9;
  static const double nameHeight = 7, nameGlyph = 8;

  static const double dashGlyph = 54, dashY = 54.8;
  static const double dash1 = 172.5, dash2 = 349.3;

  static const double departmentCx = 496, departmentPitch = 16;
  static const double departmentTop = 57.8, departmentHeight = 36;
}

/// The Mayotte shield, 100×107 units over the white box.
const PlateDrawing _logo = PlateDrawing(100, 107, <PlateShape>[
  PlateRectShape(0, 0, 100, 107, MayotteColors.white),
  PlateRectShape(32, 42, 36, 24, MayotteColors.logoBlue),
  PlateRectShape(32, 66, 36, 22, MayotteColors.logoRed),
  PlateCrescentShape(50, 54, 7, 2, 6, MayotteColors.white),
  PlateRectShape(18, 52, 8, 32, MayotteColors.logoGrey),
  PlateRectShape(74, 52, 8, 32, MayotteColors.logoGrey),
]);

/// Groups `prefix`, `number`, `suffix` and `department` — the SIV `AA-000-AA`
/// with the département `976` on the right band. The EU band and its `F` are
/// painted by the background and the panel; the Mayotte logo is a drawing decal
/// over a white box.
abstract final class MayottePlates {
  static final PlateSpec private = _spec();

  static List<PlateSpec> get all => <PlateSpec>[private];

  static PlateSlot _slot(
    PlateAlphabet alphabet,
    double cx,
    double pitch,
    double top,
    double height,
    int length, {
    Color? color,
  }) => PlateSlot(
    alphabet: alphabet,
    box: PlateBox(cx - length * pitch / 2, top, length * pitch, height),
    length: length,
    spacing: max(0, pitch - 0.6 * 0.72 * height),
    color: color,
  );

  static PlateLabel _dash(double cx) => PlateLabel(
    text: '-',
    box: PlateBox(cx - 15, _Layout.dashY - _Layout.dashGlyph / 2, 30, _Layout.dashGlyph),
    glyphHeight: _Layout.dashGlyph,
  );

  static PlateSpec _spec() {
    return PlateSpec(
      id: 'yt.private',
      country: MayotteCountry.mayotte,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: PlatePanel(
        box: PlateBox(
          _Layout.bandCx - _Layout.panelWidth / 2,
          0,
          _Layout.panelWidth,
          _Layout.panelHeight,
        ),
        padding: EdgeInsets.zero,
      ),
      background: const PlateSection.columns(<PlatePart>[
        PlatePart(PlateSection.fill(PlateFill.panel), end: _Layout.leftEnd),
        PlatePart(PlateSection.plain, end: _Layout.rightStart),
        PlatePart(PlateSection.fill(PlateFill.panel)),
      ]),
      decals: const <PlateDecal>[
        PlateDecal(
          drawing: _logo,
          box: PlateBox(_Layout.logoLeft, _Layout.logoTop, _Layout.logoWidth, _Layout.logoHeight),
        ),
      ],
      slots: <PlateSlot>[
        _slot(MayotteAlphabets.letters, 107.4, 47.3, 0, 110, 2),
        _slot(MayotteAlphabets.digits, 262, 47.5, 0, 110, 3),
        _slot(MayotteAlphabets.letters, 413, 45.3, 0, 110, 2),
        _slot(
          MayotteAlphabets.digits,
          _Layout.departmentCx,
          _Layout.departmentPitch,
          _Layout.departmentTop,
          _Layout.departmentHeight,
          3,
          color: MayotteColors.white,
        ),
      ],
      labels: <PlateLabel>[
        PlateLabel(
          text: 'F',
          box: PlateBox(
            _Layout.bandCx - _Layout.fWidth / 2,
            _Layout.fTop,
            _Layout.fWidth,
            _Layout.fHeight,
          ),
          glyphHeight: _Layout.fGlyph,
          color: MayotteColors.white,
        ),
        PlateLabel(
          text: 'MAYOTTE',
          box: PlateBox(
            _Layout.logoLeft,
            _Layout.logoTop + 0.5,
            _Layout.logoWidth,
            _Layout.nameHeight,
          ),
          glyphHeight: _Layout.nameGlyph,
          color: MayotteColors.logoGrey,
        ),
        _dash(_Layout.dash1),
        _dash(_Layout.dash2),
      ],
      textGroups: const <PlateTextGroup>[
        PlateTextGroup(<int>[0], key: 'prefix'),
        PlateTextGroup(<int>[1], key: 'number'),
        PlateTextGroup(<int>[2], key: 'suffix'),
        PlateTextGroup(<int>[3], key: 'department'),
      ],
    );
  }
}
