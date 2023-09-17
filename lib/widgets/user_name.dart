// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class UserName extends StatelessWidget {
//   final String namee;
//   const UserName({
//     Key? key,
//     required this.namee,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference collectionReference =
//         FirebaseFirestore.instance.collection('users');
//     return FutureBuilder(
//       builder: (context, snapshot) {
//         // if (snapshot.connectionState == ConnectionState.done) {
//         //   //  Map<String,dynamic> data = snapshot.data!.data().\
//         //   return null;
//         // } else {}
//       },
//     );
//   }
// }
