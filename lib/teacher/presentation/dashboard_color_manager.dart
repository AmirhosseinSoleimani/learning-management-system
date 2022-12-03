import 'package:flutter/material.dart';

class ColorManagement {
  static Color primary = HexColor.fromHex('#ED9728');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color grey1 = HexColor.fromHex('#707070');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color error = HexColor.fromHex('#e61f34');
  static Color darkPrimary = HexColor.fromHex('#d17d11');
}

class ColorTeacherPanel {
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color text_2 = HexColor.fromHex('#3F3D56');
  static Color statusPerson = HexColor.fromHex('#3F3D56');
  static Color searchContainer = HexColor.fromHex('#D9D9D9');
  static Color listCourse = HexColor.fromHex('#E6E6E6');
  static Color chartColorBorder = HexColor.fromHex('#CCCCCC');
  static Color boxColorGreen = HexColor.fromHex('#5DBF23');
  static Color boxColorDeactive = HexColor.fromHex('#E6E6E6');
  static Color boxNotifColor = HexColor.fromHex('#7E7979');
  static Color boxCalColor = const Color(0xbf177FB0);
  static Color cardColorMain = const Color(0x73D3E8C9);
  static Color cardColorLeftBorde = HexColor.fromHex('#109534');
}

// 109534
// '#737477'
//'#9E9E9E'
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
