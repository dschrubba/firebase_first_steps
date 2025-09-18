import 'package:firebase_first_steps/theme/brands.dart';
import 'package:firebase_first_steps/widgets/google_sign_in_button/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class ScreenLoginBody extends StatelessWidget {
  const ScreenLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GoogleSignInButton(buttonFontSize: GoogleButtonFontSize.fs14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
