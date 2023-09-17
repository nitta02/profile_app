import 'package:flutter/material.dart';
import 'package:profile_app/colors/colors.dart';
import 'package:profile_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
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
        fontFamily: 'Mooli',
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          
          backgroundColor: CustomColors.appBarColor, // Material Blue
        ),
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor1,

        // scaffoldBackgroundColor: const Color.fromRGBO(110, 225, 236, 0.98),
      ),
      
      home: const LoginPage(),
    );
  }
}
