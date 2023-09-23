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
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitPulse(
                  color: Colors.white,
                  size: 30,
                ),
              );
            } else {
              return Column(
                children: [
                  CustomListTile(
                    onTap: () {},
                    texxt: 'Name',
                    image: Image.asset(
                      'assets/icons/man.png',
                    ),
                    subText: 'username',
                  ),
                  20.heightBox,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: customHeight * 0.08,
                      width: customWidth * 0.55,
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
                            text: 'mail@gmail.com',
                            fontsize: 15,
                            fontWeight: FontWeight.w300,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ));
  }
}
