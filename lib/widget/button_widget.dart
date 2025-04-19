import 'package:flutter/material.dart';
import 'package:note_app/theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  ButtonWidget({required this.icon,  this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonBackgroundColor),
            child: Center(child: Icon(icon),),
      ),
    );
  }
}
