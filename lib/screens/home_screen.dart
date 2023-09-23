import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profile_app/screens/drawer_screen.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currenUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    double customHeight = MediaQuery.of(context).size.height;
    double customWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile-O',
        ),
      ),
      drawer: const DrawerScreen(),
      body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('userss')
                .doc(currenUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitPulse(
                    color: Colors.white,
                    size: 30,
                  ),
                );
              } else {
                final data = snapshot.data!.data();
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/icons/man.png',
                            height: 80,
                            width: 80,
                          ),
                          20.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: data!['name'],
                                fontsize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  const Icon(CupertinoIcons.mail),
                                  5.widthBox,
                                  CustomText(
                                    text: data['email'],
                                    fontsize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      30.heightBox,
                      CustomText(
                        text: 'Complete Profile',
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      40.heightBox,
                      Container(
                        decoration: ShapeDecoration(
                          shape: Vx.roundedSm,
                          color: const Color.fromARGB(255, 106, 173, 227),
                        ),
                        height: customHeight * 0.8,
                        width: customWidth * 1.5,
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 5,
                          right: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Overview',
                              fontsize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            15.heightBox,
                            CustomText(
                              text:
                                  'My Self ${data['name']}. \nI currently studying Software Engineering at Daffodil Internation Univeristy.',
                              fontsize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            15.heightBox,
                            CustomText(
                              text: 'Skills',
                              fontsize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            15.heightBox,
                            CustomText(
                              text: '1.Dart \n 2.Flutter',
                              fontsize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
