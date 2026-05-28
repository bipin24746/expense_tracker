import 'package:expense_tracker/features/add_categories_screen/notifier/add_categories_notifier.dart';
import 'package:expense_tracker/features/budget_screen/notifier/budget_tracker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetBudgetTracker extends StatefulWidget {
  const BottomSheetBudgetTracker({super.key});

  @override
  State<BottomSheetBudgetTracker> createState() =>
      _BottomSheetBudgetTrackerState();
}

class _BottomSheetBudgetTrackerState extends State<BottomSheetBudgetTracker> {
  final TextEditingController amountController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  String? selectedCategory;
  // String selectedCategory = 'Food';
  String selectedType = 'Expense';

  // final List<String> categories = [
  //   'Food',
  //   'Shopping',
  //   'Transport',
  //   'Bills',
  //   'Entertainment',
  //   'Health',
  // ];


  final List<String> categories = [];
  final List<String> types = ['Expense', 'Income'];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Top Indicator
                Center(
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                /// Title
                Text(
                  "Add Transaction",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 24.h),

                /// Category Dropdown
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                Consumer(
                  builder: (context,ref,_) {
                    final categories = ref.watch(addCategoryNotifierProvider);
                    return DropdownButtonFormField<String>(
                      hint: Text("Select Category"),
                      value: selectedCategory,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                      ),
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category.name,
                          child: Text(category.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                    );
                  }
                ),

                SizedBox(height: 20.h),

                /// Amount Field
                Text(
                  "Amount",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter amount",
                    prefixIcon: const Icon(Icons.currency_rupee),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                /// Type Selection
                Text(
                  "Type",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 10.h),

                Row(
                  children: types.map((type) {
                    final isSelected = selectedType == type;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedType = type;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Center(
                            child: Text(
                              type,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20.h),

                /// Notes Field
                Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                TextFormField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Add notes...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                ),

                SizedBox(height: 28.h),

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    onPressed: () {
                      ref
                          .read(budgetNotifierProvider.notifier)
                          .add(
                            category: selectedCategory!,
                            amount: int.parse(amountController.text),
                            type: selectedType,
                        notes: noteController.text
                          );
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save Transaction",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
