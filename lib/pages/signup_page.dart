// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/pages/login_page.dart';
import 'package:profile_app/screens/home_screen.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordContoller = TextEditingController();
  final confirmpasswordContoller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool showVisibility = true;

  // String name = '';
  // String email = '';
  // String password = '';

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordContoller.dispose();
    confirmpasswordContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                builder: (context) => const LoginPage(),
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
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'name',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w200,
                letterSpacing: 1.8,
              ),
            ),
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter name';
              } else {
                return null;
              }
            },
            // onChanged: (value) {
            //   setState(() {
            //     name = value;
            //   });
            // },
          ),
          15.heightBox,
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'email',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.8,
                )),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-z0-9.!#$%&'*+/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);
              if (value.isEmpty) {
                return 'Please Enter email';
              } else if (!emailValid) {
                return "Enter valid Email";
              } else {
                return null;
              }
            },
            // onChanged: (value) {
            //   setState(() {
            //     emailController.text = value;
            //   });
            // },
          ),
          15.heightBox,
          TextFormField(
            controller: passwordContoller,
            obscureText: showVisibility,
            decoration: InputDecoration(
                suffixIcon: showVisibility
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'password',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.8,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return ' Please Enter Password';
              } else {
                return null;
              }
            },
            // onChanged: (value) {
            //   setState(() {
            //     passwordContoller.text = value;
            //   });
            // },
            onTap: () {
              setState(() {
                showVisibility = !showVisibility;
              });
            },
          ),
          10.heightBox,
          TextFormField(
            controller: confirmpasswordContoller,
            obscureText: showVisibility,
            // onTap: () {
            //   setState(() {
            //     showVisibility = !showVisibility;
            //   });
            // },
            decoration: InputDecoration(
                suffixIcon: showVisibility
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'confirm password',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.8,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter to confirm password';
              } else {
                return null;
              }
            },
          ),
          15.heightBox,
          TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _handleSignUp();

                  //User Details Save to Firebase Database/Cloud Firestor

                  addUserDetails(
                    nameController.text.trim(),
                    emailController.text.toString(),
                    passwordContoller.text.toString(),
                  );
                  // nameController.clear();
                  // emailController.clear();
                  // passwordContoller.clear();
                  // confirmpasswordContoller.clear();
                }
              },
              child: CustomText(
                text: 'Signup',
                fontsize: 24,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  Future<void> _handleSignUp() async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordContoller.text,
          )
          .then((value) async => await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              )));

      print("Details: $userCredential");
    } catch (e) {
      print('Exception');
    }
  }

  Future addUserDetails(String namee, String eemail, String paassword) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': namee,
      'email': eemail,
      'password': paassword,
    });
  }
}
