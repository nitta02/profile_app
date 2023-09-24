// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:profile_app/colors/colors.dart';

class CustomSmallDetails extends StatelessWidget {
  final String title;
  final double customHeight;
  final double customWidth;
  final String subtitle;
  const CustomSmallDetails({
    Key? key,
    required this.title,
    required this.customHeight,
    required this.customWidth,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeight,
      width: customWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // materialColor.shade600,
              materialColor.shade100,
              CustomColors.scaffoldBackgroundColor1,
            ],
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(2, 2),
            )
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
