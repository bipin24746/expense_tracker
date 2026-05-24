import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Activity",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
          ),
        ),

        SizedBox(height: 10.h),

        Container(
          height: 85.h,
          width: 0.9.sw,
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Icon Box
              Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.blue,
                  size: 24.sp,
                ),
              ),

              SizedBox(width: 12.w),

              /// Text Section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Whole Foods",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      "Today, 2:45 PM",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              /// Amount
              Text(
                "-\$142",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
//Monthly salary
        Container(
          height: 85.h,
          width: 0.9.sw,
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Icon Box
              Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.money,
                  color: Colors.green,
                  size: 24.sp,
                ),
              ),

              SizedBox(width: 12.w),

              /// Text Section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monthly Salary",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      "Yesterday",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              /// Amount
              Text(
                "+\$4,200",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}