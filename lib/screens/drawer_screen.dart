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
            leading: const Icon(Icons.home),
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
            leading: const Icon(Icons.person),
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
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log-out'),
          ),
        ],
      ),
    );
  }
}
