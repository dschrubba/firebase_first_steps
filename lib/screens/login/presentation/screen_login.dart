import 'package:firebase_first_steps/screens/login/presentation/screen_login_body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_first_steps/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: LucideIcons.key300,
        title: "Login",
      ),
      body: ScreenLoginBody(),
    );
  }
}