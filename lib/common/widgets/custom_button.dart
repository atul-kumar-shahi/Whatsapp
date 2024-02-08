import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: tabColor,
          minimumSize:Size(double.infinity, 50)
        ),
        child: Text(
          text,
          style: TextStyle(color: blackColors),
        ));
  }
}
