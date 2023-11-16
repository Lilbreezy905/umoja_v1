import 'package:flutter/material.dart';
import 'package:umoja_v1/colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
   final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color
      ),
      onPressed: onPressed,
    child: Text(text,
    style:const  TextStyle(
        color: blackColor,
    ),),
    );
  }
}
