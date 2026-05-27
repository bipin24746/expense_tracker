import 'package:expense_tracker/features/add_categories_screen/presentation/add_categories_screen.dart';
import 'package:expense_tracker/features/budget_screen/presentation/screen/budget_screen.dart';
import 'package:expense_tracker/features/home_screen/presentation/screen/home_screen.dart';
import 'package:expense_tracker/features/splash_screen/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    ShellRoute(
        builder: ((context, state, child) => Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _calculateSelectedIndex(context),

              onTap: (index){
                if(index == 0) context.go('/home');
                if(index == 1) context.go('/addCategories');
                if(index == 2) context.go('/budget');
              },
              items: const[
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.food_bank),label: 'Add Categories'),
                BottomNavigationBarItem(icon: Icon(Icons.money),label: 'Budget'),
              ]),
        )),
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
          GoRoute(
            path: '/budget',
            builder: (BuildContext context, GoRouterState state) {
              return const BudgetScreen();
            },
          ),
          GoRoute(
            path: '/addCategories',
            builder: (BuildContext context, GoRouterState state) {
              return const AddCategoriesScreen();
            },
          ),
    ])

  ],
);

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).uri.toString();

  if (location == '/home') {
    return 0;
  }
  if (location == '/addCategories') {
    return 1;
  }
  if (location == '/budget') {
    return 2;
  }

  return 0;
}
