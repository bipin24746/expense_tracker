import 'package:expense_tracker/features/home_screen/presentation/screen/home_screen.dart';
import 'package:expense_tracker/features/splash_screen/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
