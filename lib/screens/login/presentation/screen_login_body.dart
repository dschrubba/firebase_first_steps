import 'package:firebase_first_steps/repositories/auth_repository/auth_repository_firebase.dart';
import 'package:firebase_first_steps/theme/brands.dart';
import 'package:firebase_first_steps/widgets/google_sign_in_button/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLoginBody extends StatefulWidget {
  const ScreenLoginBody({super.key});
  @override
  State<ScreenLoginBody> createState() => _ScreenLoginBodyState();
}

class _ScreenLoginBodyState extends State<ScreenLoginBody> {
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  InputDecoration getInputDecoration(BuildContext context, String hint) => InputDecoration(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Theme.of(context).cardColor,
    hintText: hint
  );
  @override
  Widget build(BuildContext context) {
    usernameController ??= TextEditingController();
    passwordController ??= TextEditingController();
    AuthRepositoryFirebase auth = Provider.of<AuthRepositoryFirebase>(
      context,
      listen: false,
    );
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    spacing: 24,
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: getInputDecoration(context, "Username"),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: getInputDecoration(context, "Passwort"),
                        obscureText: true,
                      ),
                      FilledButton(onPressed: () {
                        auth.signInWithEmailAndPassword(
                          usernameController!.text.trim(), 
                          passwordController!.text.trim()
                          );
                      }, child: Text("Sign In"))
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 16),
                GoogleSignInButton(
                  buttonFontSize: GoogleButtonFontSize.fs14,
                  onButtonPress: () {
                    auth.signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
