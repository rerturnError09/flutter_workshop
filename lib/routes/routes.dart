
import 'package:go_router/go_router.dart';
import 'package:interview_app/_pages/_start_interveiw_page.dart';
import 'package:interview_app/_pages/interface_page.dart'; 

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InterfacePage(), // Point to your screen
    ),
   // In your routes file
GoRoute(
  path: '/_start_interveiw_page', // Ensure this has the '/'
  builder: (context, state) => const Mystartinterviewpage(),
),
    
  ],
);