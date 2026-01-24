import 'package:flutter/material.dart';
import 'package:interview_app/pages/home_page/ui/desktop_ui/desktop_view.dart';
import 'package:interview_app/pages/home_page/ui/mobile_ui/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_)=> MobileView(),
      desktop: (_) => DesktopView(),
      // tablet: (_) => Tab(),
    );
  }
}