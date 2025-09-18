import 'package:firebase_first_steps/repositories/auth_repository/auth_repository_firebase.dart';
import 'package:firebase_first_steps/screens/home/presentation/screen_home_body.dart';
import 'package:firebase_first_steps/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {  
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {

  AuthRepositoryFirebase? auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: LucideIcons.house300,
        title: "Home",
        actions: [
          IconButton(
            onPressed: () {
              _logOut(context);
              }, 
              icon: Icon(LucideIcons.logOut300)
              )
        ],
      ),
      body: ScreenHomeBody(),
    );
  }

  void _logOut(BuildContext context) {
    auth ??= Provider.of<AuthRepositoryFirebase>(context, listen: false);
    auth!.signOut();
  }
}