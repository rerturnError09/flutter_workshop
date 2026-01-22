import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CameraInterview extends StatefulWidget {
  const CameraInterview({super.key});

  @override
  State<CameraInterview> createState() => _CameraInterviewState();
}

class _CameraInterviewState extends State<CameraInterview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back_ios_new_sharp),
          ),
          title: Center(
            child: Text(
              'Camera Interview',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 250,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
