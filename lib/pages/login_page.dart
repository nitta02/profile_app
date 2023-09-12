import 'package:flutter/material.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/social.png',
                  height: 50,
                  width: 50,
                ),
                CustomText(
                  text: 'ProfileO',
                  fontsize: 22,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Welcome Back!',
                  fontsize: 20,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: 'Sign in to continue!',
                  fontsize: 25,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            singInForm(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Don't have an account?",
                      fontsize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: 'SignUp',
                          fontsize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                10.heightBox,
                CustomText(
                  text: 'Forget Password',
                  fontsize: 14,
                  fontWeight: FontWeight.w300,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget singInForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'username or email',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w200,
                letterSpacing: 1.8,
              )),
        ),
        15.heightBox,
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'password',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w200,
                letterSpacing: 1.8,
              )),
        ),
        10.heightBox,
        TextButton(
            onPressed: () {},
            child: CustomText(
              text: 'Login',
              fontsize: 24,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
