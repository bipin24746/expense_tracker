import 'package:expense_tracker/features/add_categories_screen/data/data_source/categories_local_data_source.dart';
import 'package:expense_tracker/features/add_categories_screen/data/data_source/local_database_provider.dart';
import 'package:expense_tracker/features/add_categories_screen/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCategoriesNotifier extends AsyncNotifier<List<CategoriesModel>> {
  @override
  Future<List<CategoriesModel>> build() async {
    final localDb = ref.read(localDatabaseProvider);

    final categories = await localDb
        .select(localDb.categoriesLocalDataSource)
        .get();

    return categories
        .map((data) => CategoriesModel(
      name: data.name,
      icon: data.icon,
      isSelected: data.isSelected,
    ))
        .toList();
  }

  Future<void> add({
    required String name,
    required String icon,
  }) async {
    final addDb = ref.read(localDatabaseProvider);

    await addDb.addCategory(name: name, icon: icon);

    final current = state.value ?? [];

    state = AsyncData([
      ...current,
      CategoriesModel(name: name, icon: icon),
    ]);
  }

  Future<void> delete({required String name}) async {
    final deleteDb = ref.read(localDatabaseProvider);

    await deleteDb.deleteCategory(name: name);

    final current = state.value ?? [];

    state = AsyncData(
      current.where((e) => e.name != name).toList(),
    );
  }

  Future<void> selectCategory({required String name}) async {
    final selectedDb = ref.read(localDatabaseProvider);

    await selectedDb.selectCategory(name);

    final current = state.value ?? [];

    state = AsyncData(
      current.map((e) {
        return CategoriesModel(
          name: e.name,
          icon: e.icon,
          isSelected: e.name == name, // manually toggle
        );
      }).toList(),
    );
  }
}

final addCategoryNotifierProvider =
    AsyncNotifierProvider<AddCategoriesNotifier, List<CategoriesModel>>(
      () => AddCategoriesNotifier(),
    );

