import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final Color buttoncolor;
  final Color buttontextcolor;
  final VoidCallback onPressed;

  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttoncolor,
    required this.buttontextcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor,
          foregroundColor: buttontextcolor,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
