import 'package:expense_tracker/features/add_categories_screen/widget/add_categories_widget.dart';
import 'package:flutter/material.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Categories"),),
      body: const AddCategoriesWidget(),
    );
  }
}
