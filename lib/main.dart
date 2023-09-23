import 'package:flutter/material.dart';
import 'package:profile_app/colors/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:profile_app/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile-O',
      theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: AppBarTheme(
            elevation: 0.0,

            backgroundColor: materialColor.shade900, // Material Blue
          ),
          scaffoldBackgroundColor: materialColor.shade200,
          drawerTheme: DrawerThemeData(
            backgroundColor: materialColor.shade400,
          )
          // scaffoldBackgroundColor: const Color.fromRGBO(110, 225, 236, 0.98),
          ),
      home: const SplashScreen(),
    );
  }
}
