import 'package:flutter/material.dart';


class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color buttoncolor;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed; // This is the function parameter

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttoncolor,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor, // Dynamic Color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32), // Dynamic Icon
            const SizedBox(height: 16),
            Text(
              title, // Dynamic Title
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              description, // Dynamic Description
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 49,
              child: ElevatedButton(
                onPressed: onPressed, // Dynamic Function
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttoncolor,
                  //  const Color(0xFF3F51B5),
                  foregroundColor: Colors.white,//test color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                ),
                child: Text(
                  buttonText, // Dynamic Button Text
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
