import 'package:flutter/material.dart';
import 'package:profile_app/colors/colors.dart';
import 'package:profile_app/pages/login_page.dart';
import 'package:profile_app/screens/home_screen.dart';
import 'package:profile_app/screens/profile_screen.dart';
import 'package:profile_app/services/firebase_services.dart';

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
            child: CircleAvatar(
              maxRadius: 50,
              backgroundColor: CustomColors.scaffoldBackgroundColor,
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
              backgroundColor: CustomColors.scaffoldBackgroundColor,
              child: Image.asset(
                'assets/icons/house.png',
                height: 35,
              ),
            ),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            },
            leading: CircleAvatar(
              backgroundColor: CustomColors.scaffoldBackgroundColor,
              child: Image.asset(
                'assets/icons/man.png',
                height: 35,
              ),
            ),
            title: const Text('Profile'),
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
              backgroundColor: CustomColors.scaffoldBackgroundColor,
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
