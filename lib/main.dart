import 'package:expense_tracker/core/utils/colors.dart';
import 'package:expense_tracker/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            iconTheme: IconThemeData(
              color: AppColors.navIcon,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.navBar,
              titleTextStyle: TextStyle(
                color: AppColors.navText,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
          ),
          routerConfig: router,
        );
      },
    );
  }
}