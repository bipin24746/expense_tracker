import 'package:expense_tracker/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionList extends StatelessWidget {
  const ActionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Actions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            actionList(Icons.fastfood, "Food"),
            actionList(Icons.directions_car, "Transport"),
            actionList(Icons.house, "Housing"),
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 55.w,
                  child: Container(decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Center(child: Text("+",style: TextStyle(color: AppColors.text,fontSize: 40.sp),)),),
                ),
                Text("New",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ],
    );
  }
}

Widget actionList(IconData icon, String title) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          icon,
          size: 28.sp,
          color: Colors.blue,
        ),
      ),

      SizedBox(height: 6.h),

      Text(
        title,
        style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),
      ),
    ],
  );
}