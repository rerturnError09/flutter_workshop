import 'package:go_router/go_router.dart';
import 'package:interview_app/pages/camera_interview_page/ui/camera_interview.dart';
import 'package:interview_app/pages/home_page/ui/home.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const Home(), // Point to your screen
    ),
    // In your routes file
    GoRoute(
      path: '/CameraInterview', // Ensure this has the '/'
      builder: (context, state) => const CameraInterview(),
    ),
  ],
);
