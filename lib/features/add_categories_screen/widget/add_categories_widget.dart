import 'package:expense_tracker/core/utils/colors.dart';
import 'package:expense_tracker/features/add_categories_screen/notifier/add_categories_notifier.dart';
import 'package:expense_tracker/features/budget_screen/notifier/budget_tracker_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoriesWidget extends StatefulWidget {
  const AddCategoriesWidget({super.key});

  @override
  State<AddCategoriesWidget> createState() => _AddCategoriesWidgetState();
}

class _AddCategoriesWidgetState extends State<AddCategoriesWidget> {
  TextEditingController categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(
                "Add Food Categories",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20.h),

              /// Input Field
              TextField(
                controller: categoryNameController,
                decoration: InputDecoration(
                  hintText: "Enter category name",
                  hintStyle: TextStyle(fontSize: 14.sp),
                  prefixIcon: Icon(Icons.fastfood, size: 22.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 14.w,
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              /// Add Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (categoryNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.error,
                          content: Text("Categories name cannot be blank!"),
                        ),
                      );
                    } else {
                      ref
                          .read(addCategoryNotifierProvider.notifier)
                          .add(
                            name: categoryNameController.text,
                            icon: 'Icons.fastFood',
                          );
                    }
                    print(categoryNameController.text);
                  },
                  icon: Icon(Icons.add, size: 20.sp),
                  label: Text(
                    "Add Category",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              /// Categories List
              Expanded(
                child: Consumer(
                  builder: (context, ref, _) {
                    final category = ref.watch(addCategoryNotifierProvider);
                    return ListView.separated(
                      itemCount: category.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final currentCategory = category[index];
                        final expandingAmount = ref
                            .watch(budgetNotifierProvider)
                            .where(
                              (categoryName) =>
                                  currentCategory.name == categoryName.category,
                            );

                        return ExpansionTile(
                          title: Text(category[index].name),

                          leading: Icon(Icons.food_bank),
                          trailing: IconButton(onPressed: (){
                            ref
                                          .watch(
                                            addCategoryNotifierProvider.notifier,
                                          )
                                          .delete(name: currentCategory.name);

                          }, icon: Icon(Icons.delete)),
                          children: [
                            for (var expand in expandingAmount)
                            Text(expand.amount.toString())

                          ],
                        );

                        // return Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 16.w,
                        //     vertical: 14.h,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey.shade100,
                        //     borderRadius: BorderRadius.circular(14.r),
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       CircleAvatar(
                        //         radius: 22.r,
                        //         backgroundColor: Colors.orange,
                        //         child: Icon(
                        //           Icons.restaurant_menu,
                        //           color: Colors.white,
                        //           size: 20.sp,
                        //         ),
                        //       ),
                        //
                        //       SizedBox(width: 14.w),
                        //
                        //       Expanded(
                        //         child: Text(
                        //           category[index].name,
                        //           style: TextStyle(
                        //             fontSize: 16.sp,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //       ),
                        //
                        //       IconButton(
                        //         onPressed: () {
                        //           ref
                        //               .watch(
                        //                 addCategoryNotifierProvider.notifier,
                        //               )
                        //               .delete(name: currentCategory.name);
                        //         },
                        //         icon: Icon(
                        //           Icons.delete_outline,
                        //           color: Colors.red,
                        //           size: 24.sp,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
