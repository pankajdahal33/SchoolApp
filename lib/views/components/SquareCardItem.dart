// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? name;
  final Icon? icon;
  Function? onTap;
  bool? isSelected;

  CardWidget({
    Key? key,
    required this.name,
    required this.icon,
    this.isSelected,
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
          color: isSelected!
              ? Theme.of(context).backgroundColor
              : Theme.of(context).cardColor,
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon!.icon,
                size: 50,
              ),
              Text(
                name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
