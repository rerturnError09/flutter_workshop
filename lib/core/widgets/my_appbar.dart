import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  final IconData iconname;
  final String title;
  final VoidCallback onPressed;

  const MyAppbar({
    required this.iconname, 
    required this.title, 
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        leading: IconButton(onPressed: onPressed, icon: Icon(iconname)),
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );
    
  }
}
