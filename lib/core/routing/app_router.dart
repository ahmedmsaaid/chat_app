import 'package:chat_app/features/singn_in_up/login/login_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/views/splash_screen.dart';

abstract class AppRouter {
  static const String login = '/login';
  static const String register = '/register';
  static const String homeScreen = '/home';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: register,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: homeScreen,
      builder: (context, state) => const SplashScreen(),
    ),
  ]);
}
