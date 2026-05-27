import 'package:expense_tracker/features/add_categories_screen/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCategoriesNotifier extends Notifier<List<CategoriesModel>> {
  @override
  List<CategoriesModel> build() {
    return [
      CategoriesModel(
        'Pizza', '🐶'
      )
    ];
  }

  void add({required String name, required String icon}) {
    final addCategory = CategoriesModel(name, icon);
    state = [...state, addCategory];
  }
}

final addCategoryNotifierProvider =
    NotifierProvider<AddCategoriesNotifier, List<CategoriesModel>>(
      () => AddCategoriesNotifier(),
    );
