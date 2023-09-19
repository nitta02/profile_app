import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profile_app/pages/signup_page.dart';
import 'package:profile_app/screens/home_screen.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void signInMethod() {
    auth
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ));
                        },
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
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter email';
              } else {
                return null;
              }
            },
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'username or email',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.8,
                )),
          ),
          15.heightBox,
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter password';
              } else {
                return null;
              }
            },
            controller: passwordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'password',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.8,
                )),
          ),
          10.heightBox,
          TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  signInMethod();
                } else {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              child: CustomText(
                text: 'Login',
                fontsize: 24,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
