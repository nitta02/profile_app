import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profile_app/colors/colors.dart';
import 'package:profile_app/screens/drawer_screen.dart';
import 'package:profile_app/widgets/custom_container.dart';
import 'package:profile_app/widgets/custom_text.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final curentUser = FirebaseAuth.instance.currentUser;
  final userData = FirebaseFirestore.instance.collection('userss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('userss')
                .doc(curentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/man.png',
                          height: 80,
                          width: 80,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: data['name'],
                                  fontsize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: data['email'],
                                  fontsize: 12,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person),
                        ),
                      ],
                    ),
                    35.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'DETAILS',
                          fontsize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        20.heightBox,
                        CustomContainer(
                          onPressed: () => editOption('Name'),
                          customText: 'Name',
                          customMailname: data['name'],
                        ),
                        20.heightBox,
                        CustomContainer(
                          onPressed: () => editOption('E-mail'),
                          customText: 'Mail',
                          customMailname: data['email'],
                        ),
                        20.heightBox,
                        CustomContainer(
                          onPressed: () => editOption('Password'),
                          customText: 'password',
                          customMailname: data['password'],
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitPulse(
                    color: Colors.white,
                    size: 30,
                  ),
                );
              }
            },
          )),
    );
  }

  Future<void> editOption(String textFeild) async {
    String newName = '';
    final newNameController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: CustomColors.scaffoldBackgroundColor1,
          title: Text('Update'),
          content: TextFormField(
            
            decoration: InputDecoration(
              hintText: textFeild,
            ),
            onChanged: (value) {
              newNameController.text = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(newNameController),
              child: Text('Save'),
            )
          ],
        );
      },
    );
    if (newNameController.text.trim().isNotEmpty) {
      await userData.doc(curentUser!.email).update({
        textFeild: newNameController.text,
      });
    }
  }
}
