import 'package:flutter/material.dart';
import 'package:profile_app/colors/colors.dart';
import 'package:profile_app/pages/login_page.dart';
import 'package:profile_app/screens/home_screen.dart';
import 'package:profile_app/screens/profile_screen.dart';
import 'package:profile_app/services/firebase_services.dart';
import 'package:profile_app/widgets/custom_list.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            margin: const EdgeInsets.all(
              10,
            ),
            child: CircleAvatar(
              maxRadius: 50,
              backgroundColor: materialColor.shade400,
              // foregroundColor: CustomColors.scaffoldBackgroundColor,
              child: const Image(
                image: AssetImage('assets/icons/man.png'),
                height: 130,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            leading: CircleAvatar(
              backgroundColor: materialColor.shade400,
              child: Image.asset(
                'assets/icons/house.png',
                height: 35,
              ),
            ),
            title: const Text('Home'),
          ),
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            hoverColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            },
            leading: CircleAvatar(
              backgroundColor: materialColor.shade400,
              child: Image.asset(
                'assets/icons/man.png',
                height: 35,
              ),
            ),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundColor: materialColor.shade400,
              child: Image.asset(
                'assets/icons/written-paper.png',
                height: 35,
              ),
            ),
            title: const Text('Details'),
          ),
          ListTile(
            onTap: () {
              FirebaseServices.auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              });
            },
            leading: CircleAvatar(
              backgroundColor: materialColor.shade400,
              child: Image.asset(
                'assets/icons/check-out.png',
                height: 35,
              ),
            ),
            title: const Text('Log-out'),
          ),
        ],
      ),
    );
  }
}
