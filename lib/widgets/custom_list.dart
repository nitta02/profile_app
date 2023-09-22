// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:profile_app/colors/colors.dart';

class CustomListTile extends StatelessWidget {
  final Function() onTap;
  final String texxt;
  final Image image;
  const CustomListTile({
    Key? key,
    required this.onTap,
    required this.texxt,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: ListView(
        children: [
          ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              backgroundColor: materialColor.shade400,
              child: Image(
                image: AssetImage(image as String),
              ),
            ),
            title: Text(texxt),
          ),
        ],
      ),
    );
  }
}
