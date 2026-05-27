import 'package:expense_tracker/features/budget_screen/notifier/budget_tracker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        final transaction = ref.watch(budgetNotifierProvider);
        return Column(
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "Sort",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    const Icon(Icons.menu, color: Colors.black),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15.h),

            /// Cards
            for(var transactionvalues in transaction)
            _categoryCard(
              icon: Icons.shopping_cart_outlined,
              iconBg: Colors.greenAccent,
              iconColor: Colors.green,
              title: transactionvalues.category,
              // subtitle: "Spent \$420.50 of \$800",
              subtitle: "Spent \$${transactionvalues.amount} of \$800",
              // status: "GOOD",
              status: transactionvalues.type,
              statusBg: Colors.greenAccent,
              statusColor: Colors.green,
            ),

            SizedBox(height: 12.h),

            // _categoryCard(
            //   icon: Icons.movie_outlined,
            //   iconBg: Colors.red.withOpacity(0.15),
            //   iconColor: Colors.red,
            //   title: "Entertainment",
            //   subtitle: "Spent \$285 of \$300",
            //   status: "WARNING",
            //   statusBg: Colors.red.withOpacity(0.15),
            //   statusColor: Colors.red,
            // ),
            //
            // SizedBox(height: 12.h),
            //
            // _categoryCard(
            //   icon: Icons.fastfood,
            //   iconBg: Colors.red.withOpacity(0.15),
            //   iconColor: Colors.red,
            //   title: "Dining Out",
            //   subtitle: "Spent \$542.80 of \$500",
            //   status: "LIMIT REACHED",
            //   statusBg: Colors.red.withOpacity(0.15),
            //   statusColor: Colors.red,
            // ),
          ],
        );
      }
    );
  }

  Widget _categoryCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String status,
    required Color statusBg,
    required Color statusColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          /// Icon
          Container(
            height: 42.h,
            width: 42.w,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22.sp,
            ),
          ),

          SizedBox(width: 12.w),

          /// Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 10.w),

          /// Status Badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: statusBg,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}