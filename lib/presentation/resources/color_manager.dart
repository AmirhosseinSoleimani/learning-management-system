import 'package:flutter/material.dart';
class ColorManager{
  static Color primary = HexColor.fromHex('#177FB0');
  static Color slateGray1	 = HexColor.fromHex('#334155');
  static Color slateGray2	 = HexColor.fromHex('#3F3D56');
  static Color lightSteelBlue1 = HexColor.fromHex('#7E7979');
  static Color lightSteelBlue2 = HexColor.fromHex('#D9D9D9');
  static Color darkOrange = HexColor.fromHex('#C94B04');
  static Color navajoWhite	 = HexColor.fromHex('#FFF7F2');
  static Color tanOpacity30 = HexColor.fromHex('#4D7E7979');
  static Color oldLaceOpacity50 = HexColor.fromHex('#804DE6E6E6');
  static Color lightBlue1	 = HexColor.fromHex('#D7E8F1');
  static Color gold = HexColor.fromHex('#FAD564');
  static Color black = HexColor.fromHex('#000000');
  static Color ivory = HexColor.fromHex('#FFFCFC');
  static Color green = HexColor.fromHex('#5DBF23');
  static Color greenOpacity60 = HexColor.fromHex('#995DBF23');
  static Color lavender = HexColor.fromHex('#DEDCFF');
  static Color lightBlue2 = HexColor.fromHex('#E8F2F7');
  static Color lightBlue3 = HexColor.fromHex('#F1F9EC');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34'); // red color
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = 'FF' + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString,radix: 16));
  }
}