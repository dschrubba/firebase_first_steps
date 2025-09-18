import 'package:firebase_first_steps/theme/brands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatelessWidget {
  final GoogleButtonFontSize buttonFontSize;
  const GoogleSignInButton({super.key, required this.buttonFontSize});
  @override
  Widget build(BuildContext context) {
    GoogleButton googleButton;
    if (Theme.of(context).brightness == Brightness.light) {
      googleButton = GoogleButton.light(GoogleButtonFontSize.fs20);
    } else if (Theme.of(context).brightness == Brightness.dark) {
      googleButton = GoogleButton.dark(GoogleButtonFontSize.fs20);
    } else {
      googleButton = GoogleButton.neutral(GoogleButtonFontSize.fs20);
    }
    return Container(
        clipBehavior: Clip.antiAlias,
        height: googleButton.height,
        decoration: BoxDecoration(
          color: googleButton.backgroundColor,
          border: googleButton.stroke,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: googleButton.paddingLg,
            vertical:
                googleButton.paddingSm - (googleButton.stroke?.top.width ?? 0),
          ),
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: googleButton.paddingSm,
              direction: Axis.horizontal,
              children: [
                Flexible(
                  child: SvgPicture.asset(
                    fit: BoxFit.contain,
                    Brands.googleIconSvgAsset,
                    width: googleButton.iconSize,
                    height: googleButton.iconSize,
                  ),
                ),
                Flexible(
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(fontFamily: Brands.googleButtonFontFamily),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
