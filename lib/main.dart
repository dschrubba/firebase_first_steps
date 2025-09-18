import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_first_steps/firebase_options.dart';
import 'package:firebase_first_steps/repositories/auth_repository/auth_repository_firebase.dart';
import 'package:firebase_first_steps/screens/home/presentation/screen_home.dart';
import 'package:firebase_first_steps/screens/login/presentation/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    var colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color(0xFFBC00BC));
    var theme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme
      );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepositoryFirebase>(create: (_) => AuthRepositoryFirebase()),
      ],
      child: MainApp(theme: theme),
    ));
}

class MainApp extends StatelessWidget {
  final ThemeData theme;
  const MainApp({super.key, required this.theme});
  @override
  Widget build(BuildContext context) {   
    var auth = Provider.of<AuthRepositoryFirebase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        return MaterialApp(
          darkTheme: theme,
          themeMode: ThemeMode.dark,
          key: Key(snapshot.data?.uid ?? 'no_user'),
          home: snapshot.hasData ? ScreenHome() : ScreenLogin(),
    );
      },
    );
  }
}
