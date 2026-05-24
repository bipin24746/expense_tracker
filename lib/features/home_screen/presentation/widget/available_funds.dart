import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableFunds extends StatelessWidget {
  const AvailableFunds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Center(
        child: Column(
          children: [
            Text(
              "Available Funds",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              "\$12,450.80",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.sp),
            ),
          ],
        ),
      ),
    );
  }
}
