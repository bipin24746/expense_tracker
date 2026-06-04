import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCategoriesBottomSheet extends StatefulWidget {
  final String name;
  final String icon;
  final int id;
  const EditCategoriesBottomSheet({super.key, required this.name, required this.icon, required this.id});

  @override
  State<EditCategoriesBottomSheet> createState() => _EditCategoriesBottomSheetState();
}

class _EditCategoriesBottomSheetState extends State<EditCategoriesBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 0.5.sh,
      width: double.infinity,
      child: Column(
        children: [
          Text("Food Name",style: TextStyle(fontSize: 15.sp),)
        ],
      ),
    );
  }
}
