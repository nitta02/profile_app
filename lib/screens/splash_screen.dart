import 'package:flutter/material.dart';
import 'package:profile_app/utils/user_check.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    UserCheck().checkUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/social.png',
              height: 100,
              width: 100,
            ),
            20.heightBox,
            CustomText(
              text: 'Profile-O',
              fontsize: 30,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
