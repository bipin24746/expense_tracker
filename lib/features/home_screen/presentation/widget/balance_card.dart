import 'package:expense_tracker/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 0.9.sw,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            border: Border.all(),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL SPENT",
                          style: TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.w300,
                            fontSize: 11.sp,
                          ),
                        ),
                        Text(
                          "\$2,104.20",
                          style: TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "TOTAL LIMIT",
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "\$2,104.20",
                          style: TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Good",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Text(
                      "49% of budget used",
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
