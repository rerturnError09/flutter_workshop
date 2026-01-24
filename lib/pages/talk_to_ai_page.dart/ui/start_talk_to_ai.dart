import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartTalkToAi extends StatefulWidget {
  const StartTalkToAi({super.key});

  @override
  State<StartTalkToAi> createState() => _StartTalkToAiState();
}

class _StartTalkToAiState extends State<StartTalkToAi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: 
          IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_new_sharp)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
        title: Center(
          child: Text(
            'Talk to AI',style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ),
      ),
    
    ),
    );
  }
}
