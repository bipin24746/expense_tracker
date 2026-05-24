import 'package:expense_tracker/features/home_screen/presentation/widget/action_list.dart';
import 'package:expense_tracker/features/home_screen/presentation/widget/available_funds.dart';
import 'package:expense_tracker/features/home_screen/presentation/widget/money_in_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wealth Flow"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const AvailableFunds(),

            SizedBox(height: 20.h),

            const MoneyInOut(),

            SizedBox(height: 20.h),

            ActionList(),
          ],
        ),
      ),
    );
  }
}