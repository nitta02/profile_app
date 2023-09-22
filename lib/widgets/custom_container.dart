// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomContainer extends StatelessWidget {
  final String customText;
  final String customMailname;
  final Function() onPressed;
  const CustomContainer({
    Key? key,
    required this.customText,
    required this.customMailname,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 2.5,
      padding: const EdgeInsets.only(
        left: 5,
        bottom: 5,
        top: 5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 0.5,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.heightBox,
              Text(customMailname),
            ],
          ),
          IconButton(onPressed: onPressed, icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}
