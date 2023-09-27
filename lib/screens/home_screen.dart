import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profile_app/colors/colors.dart';
import 'package:profile_app/screens/drawer_screen.dart';
import 'package:profile_app/screens/profile_details.dart';
import 'package:profile_app/widgets/custom_details_sm.dart';
import 'package:profile_app/widgets/custom_list.dart';
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/icons/man.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    20.widthBox,
                    Center(
                      child: Column(
                        children: [
                          CustomText(
                            text: data!['name'],
                            fontsize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          10.heightBox,
                          CustomText(
                            text: 'App Developer',
                            fontsize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                          10.heightBox,
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: customHeight * 0.08,
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
                                    fontsize: 10,
                                    fontWeight: FontWeight.w300,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSmallDetails(
                              customHeight: customHeight * 0.1,
                              customWidth: customWidth * 0.35,
                              title: 'Education',
                              subtitle: 'SWE'),
                          10.widthBox,
                          CustomSmallDetails(
                              customHeight: customHeight * 0.1,
                              customWidth: customWidth * 0.3,
                              title: 'Experience',
                              subtitle: 'None'),
                          10.widthBox,
                          CustomSmallDetails(
                              customHeight: customHeight * 0.1,
                              customWidth: customWidth * 0.3,
                              title: 'Rate',
                              subtitle: '4.5/5'),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      height: customHeight / 3.7,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // materialColor.shade600,
                            materialColor.shade100,
                            CustomColors.scaffoldBackgroundColor1,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileDetails(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    top: 5,
                                  ),
                                  child: CustomText(
                                    text: 'Complete Profile',
                                    fontsize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_circle_right_outlined,
                                )
                              ],
                            ),
                          ),
                          10.heightBox,
                          Container(
                            height: customHeight / 5,
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: CustomText(
                                    text: 'Github Profile',
                                    fontsize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_circle_right_outlined,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    40.heightBox,
                  ],
                );
              }
            },
          )),
    );
  }
}
