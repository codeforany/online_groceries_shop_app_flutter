import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xff53B175);
  static Color get primaryText => const Color(0xff030303);
  static Color get secondaryText => const Color(0xff828282);
  static Color get textTittle => const Color(0xff7C7C7C);
  static Color get placeholder => const Color(0xffB1B1B1);
  static Color get darkGray => const Color(0xff4C4F4D);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
