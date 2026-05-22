import 'package:expense_tracker/core/utils/colors.dart';
import 'package:expense_tracker/features/home_screen/presentation/widget/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: CircleAvatar(child: Icon(Icons.person)),
        ),
        title: Text("Wealth Flow"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Icon(Icons.notifications_outlined, color: AppColors.navIcon),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Monthly Spending", style: TextStyle(fontSize: 12.sp)),
                    Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 30.h,
                    child: ElevatedButton(onPressed: (){}, child: Text("+")))
              ],
            ),
            SizedBox(height: 10.h,),
            BalanceCard(),
          ],
        ),
      ),
    );
  }
}
