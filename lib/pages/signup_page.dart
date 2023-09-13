import 'package:flutter/material.dart';
import 'package:profile_app/pages/login_page.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordContoller = TextEditingController();

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
                  text: 'Welcome!',
                  fontsize: 20,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: 'Sign up to continue!',
                  fontsize: 25,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            singInForm(),
            10.heightBox,
            // Center(
            //   child: Column(
            //     children: [
            //       CustomText(
            //         text: 'or',
            //         fontsize: 12,
            //         fontWeight: FontWeight.w300,
            //       ),
            //       10.heightBox,
            //       CustomText(
            //         text: 'Signup with',
            //         fontsize: 20,
            //         fontWeight: FontWeight.w400,
            //       )
            //     ],
            //   ),
            // ),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Already have an account?",
                      fontsize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        child: CustomText(
                          text: 'Signin',
                          fontsize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                10.heightBox,
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
              hintText: 'name',
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
              hintText: 'email',
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
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'confirm password',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w200,
                letterSpacing: 1.8,
              )),
        ),
        15.heightBox,
        TextButton(
            onPressed: () {},
            child: CustomText(
              text: 'Signup',
              fontsize: 24,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
