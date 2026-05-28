import 'package:expense_tracker/features/add_categories_screen/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCategoriesNotifier extends Notifier<List<CategoriesModel>> {
  @override
  List<CategoriesModel> build() {
    return [
      CategoriesModel(
        name: 'Pizza', icon: '🐶',
      )
    ];
  }

  void add({required String name, required String icon}) {
    final addCategory = CategoriesModel(name: name, icon: icon);
    state = [...state, addCategory];
  }
  void delete({required String name}){
    state = state.where((category) => category.name != name).toList();
  }

  void selectedCategory({required String name})
  {

  }
}

final addCategoryNotifierProvider =
    NotifierProvider<AddCategoriesNotifier, List<CategoriesModel>>(
      () => AddCategoriesNotifier(),
    );

