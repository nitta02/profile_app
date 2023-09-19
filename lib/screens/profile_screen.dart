import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/screens/drawer_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance.currentUser;
  String name = '';

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile-O'),
      ),
      drawer: const DrawerScreen(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person),
                        Text('name : $name'),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getUserId() async {
    try {
      final userDocsID = await FirebaseFirestore.instance
          .collection('users')
          .doc(auth!.uid)
          .get();

      if (userDocsID.exists) {
        final userData = userDocsID.data() as Map<String, dynamic>;

        setState(() {
          name = userData['name'] ?? '';
          // ignore: avoid_print
          print(name);
        });
      } else {
        // Handle the case where the user document doesn't exist
        // ignore: avoid_print
        print('Error');
      }
    } catch (e) {
      // Handle exceptions here
      // ignore: avoid_print
      print('Exception: $e');
    }
  }
}
