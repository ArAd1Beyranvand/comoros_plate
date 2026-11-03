import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:comoros_plate/comoros_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: ComorosPlates.standard, theme: ComorosThemes.standard),
);
