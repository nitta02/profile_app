import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profile_app/colors/colors.dart';
import 'package:profile_app/screens/drawer_screen.dart';
import 'package:profile_app/widgets/custom_list.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
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
          padding: const EdgeInsets.all(8.0),
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
                    children: [
                      CustomListTile(
                        onTap: () {},
                        texxt: data!['name'],
                        image: Image.asset(
                          'assets/icons/man.png',
                        ),
                        subText: 'username',
                      ),
                      20.heightBox,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: customHeight * 0.09,
                          width: customWidth * 0.65,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1.0,
                                offset: Offset(5, 5),
                              )
                            ],
                            gradient: LinearGradient(colors: [
                              materialColor.shade400,
                              materialColor.shade100,
                            ]),
                            borderRadius: BorderRadius.circular(8.0),
                            color: materialColor.shade300,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.mail),
                              10.widthBox,
                              CustomText(
                                text: data['email'],
                                fontsize: 15,
                                fontWeight: FontWeight.w300,
                              )
                            ],
                          ),
                        ),
                      ),
                      30.heightBox,
                      Container(
                        decoration: ShapeDecoration(
                          shape: Vx.roundedSm,
                          gradient: LinearGradient(colors: [
                            materialColor.shade400,
                            materialColor.shade100,
                          ]),
                        ),
                        height: customHeight * 0.45,
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
                      30.heightBox,
                      Container(
                        decoration: ShapeDecoration(
                          shape: Vx.roundedSm,
                          gradient: LinearGradient(colors: [
                            materialColor.shade400,
                            materialColor.shade100,
                          ]),
                        ),
                        height: customHeight * 0.3,
                        width: customWidth * 1.5,
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 5,
                          right: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Informations',
                              fontsize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            15.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(CupertinoIcons.tv_circle),
                                    5.widthBox,
                                    CustomText(
                                      text: 'website',
                                      fontsize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            15.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(CupertinoIcons.mail),
                                    5.widthBox,
                                    CustomText(
                                      text: 'e-mail',
                                      fontsize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                10.widthBox,
                                CustomText(
                                  text: data['email'],
                                  fontsize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            15.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(CupertinoIcons.phone),
                                    5.widthBox,
                                    CustomText(
                                      text: 'phone',
                                      fontsize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                10.widthBox,
                                CustomText(
                                  text: 'number',
                                  fontsize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
