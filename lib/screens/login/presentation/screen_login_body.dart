import 'package:firebase_first_steps/theme/brands.dart';
import 'package:firebase_first_steps/widgets/google_sign_in_button/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class ScreenLoginBody extends StatelessWidget {
  const ScreenLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleSignInButton(buttonFontSize: GoogleButtonFontSize.fs14);
  }
}