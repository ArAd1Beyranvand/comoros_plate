import 'dart:io';

import 'package:comoros_plate/comoros_plate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per design, rendered with a real face so the ink can be measured
/// against the article's artwork and photograph.
void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final loader = FontLoader('Roboto');
    for (final path in const <String>[
      '/usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Bold.ttf',
    ]) {
      final file = File(path);
      if (!file.existsSync()) continue;
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  final cases = <(String, PlateSpec, PlateTheme, String)>[
    ('standard', ComorosPlates.standard, ComorosThemes.standard, '1284A73'),
    ('square', ComorosPlates.square, ComorosThemes.square, '079U73'),
  ];

  test('every spec has a golden', () {
    expect(cases.map((c) => c.$2).toSet(), ComorosPlates.all.toSet());
  });

  for (final (name, spec, theme, values) in cases) {
    testWidgets(name, (tester) async {
      final controller = PlateController.fromValues(spec, values.split('').toList());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 520,
                height: 520 * spec.canvasHeight / spec.canvasWidth,
                child: PlateView(
                  controller: controller,
                  theme: theme,
                  country: ComorosCountry.comoros,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(find.byType(PlateView), matchesGoldenFile('goldens/$name.png'));
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
