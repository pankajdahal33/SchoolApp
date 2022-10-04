// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? name;
  final Icon? icon;
  Function? onTap;
  CardWidget({
    Key? key,
    required this.name,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon!.icon,
                size: 50,
              ),
              Text(name!),
            ],
          ),
        ),
      ),
    );
  }
}
