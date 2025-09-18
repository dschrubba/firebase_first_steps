import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Brands {

  // Google Icon Asset
  static const String googleIconSvgAsset = "assets/google/g-logo.svg";

  // Google Button Generic
  static const String googleButtonFontFamily = "Roboto";

  // Google Button Light
  static const Color  googleButtonBgLight = Color(0xFFFFFFFF);
  static const Color  googleButtonFontColorLight = Color(0xFF1F1F1F);
  static const Color  googleButtonStrokeColorLight = Color(0xFF747775);

  // Google Button Dark
  static const Color  googleButtonBgDark = Color(0xFF131314);
  static const Color  googleButtonFontColorDark = Color(0xFFE3E3E3);
  static const Color  googleButtonStrokeColorDark = Color(0xFF8E918F);

  // Google Button Neutral
  // Has no stroke
  static const Color  googleButtonBgNeutral = Color(0xFFF2F2F2);
  static const Color  googleButtonFontColorNeutral = Color(0xFF1F1F1F);
}
  
class GoogleButton {
  
  final Color   backgroundColor;
  final Color   fontColor;
  final Border? stroke;
  final GoogleButtonFontSize buttonFontSize;
  
  // Set in constructor body
  late double height;
  late double iconSize;
  late double paddingSm;
  late double paddingMd;
  late double paddingLg;

  double fontSize() => (buttonFontSize == GoogleButtonFontSize.fs20) ? 20 : 14;

  GoogleButton({
    required this.backgroundColor,
    required this.fontColor,
    required this.stroke,
    required this.buttonFontSize,
    }) {
      /*
        Referring to https://developers.google.com/identity/branding-guidelines
      */
      if (Platform.isAndroid) {
        height = 40;
        paddingLg = 12;
        paddingSm = 10;
        iconSize = 20;
      }
      else if (Platform.isIOS) {
        height = 44;
        paddingLg = 16;
        paddingSm = 12;
        iconSize = 20;
      }
      else {
        height = 40;
        paddingLg = 12;
        paddingSm = 10;
        iconSize = 20;
      }
    }

    factory GoogleButton.light(GoogleButtonFontSize buttonFontSize) {
      const Color  backgroundColor = Brands.googleButtonBgLight;
      const Color  fontColor = Brands.googleButtonFontColorLight;
      final Border stroke = Border.all(
        strokeAlign: BorderSide.strokeAlignInside,
        width: 1,
        color: Brands.googleButtonStrokeColorLight
      );
      return GoogleButton(
        backgroundColor: backgroundColor,
        fontColor: fontColor,
        stroke: stroke,
        buttonFontSize: buttonFontSize);
    }

    factory GoogleButton.dark(GoogleButtonFontSize buttonFontSize) {
      const Color  backgroundColor = Brands.googleButtonBgDark;
      const Color  fontColor = Brands.googleButtonFontColorDark;
      final Border stroke = Border.all(
        width: 1,
        color: Brands.googleButtonStrokeColorDark
      );
      return GoogleButton(
        backgroundColor: backgroundColor,
        fontColor: fontColor,
        stroke: stroke,
        buttonFontSize: buttonFontSize);
    }

    factory GoogleButton.neutral(GoogleButtonFontSize buttonFontSize) {
      const Color   backgroundColor = Brands.googleButtonBgNeutral;
      const Color   fontColor = Brands.googleButtonFontColorNeutral;
      const Border? stroke = null;
      return GoogleButton(
        backgroundColor: backgroundColor,
        fontColor: fontColor,
        stroke: stroke,
        buttonFontSize: buttonFontSize);
    }
}

enum GoogleButtonVariant {
  light,
  dark,
  neutral,
}

enum GoogleButtonFontSize {
  fs20,
  fs14
}