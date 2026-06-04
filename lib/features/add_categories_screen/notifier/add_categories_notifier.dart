import 'package:expense_tracker/features/add_categories_screen/data/data_source/categories_local_data_source.dart';
import 'package:expense_tracker/features/add_categories_screen/data/data_source/local_database_provider.dart';
import 'package:expense_tracker/features/add_categories_screen/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCategoriesNotifier extends AsyncNotifier<List<CategoriesModel>> {
  AppDatabase get localCategoryDb {
    return ref.read(localDatabaseProvider);
  }
  
  
  @override
  Future<List<CategoriesModel>> build() async {
 

    final categories = await localCategoryDb
        .select(localCategoryDb.categoriesLocalDataSource)
        .get();

    print(categories.first.id);

    return categories
        .map(
          (data) => CategoriesModel(
            id: data.id,
            name: data.name,
            icon: data.icon,
            isSelected: data.isSelected,
          ),
        )
        .toList();
  }

  Future<void> add({required String name, required String icon}) async {
    state = AsyncLoading();

    await localCategoryDb.addCategory(name: name, icon: icon);



    final category = await fetchCategories();
    state = AsyncData(category);
  }

  Future<void> delete({required int id}) async {
    final deleteDb = ref.read(localDatabaseProvider);

    await deleteDb.deleteCategory(id: id);

    final current = state.value ?? [];

    state = AsyncData(current.where((e) => e.id != id).toList());
  }

  Future<void> selectCategory({required int id, required String name}) async {

    await localCategoryDb.selectCategory(name);

    final current = state.value ?? [];

    state = AsyncData(
      current.map((e) {
        return CategoriesModel(
          id: e.id,
          name: e.name,
          icon: e.icon,
          isSelected: e.name == name, // manually toggle
        );
      }).toList(),
    );
  }

  Future<List<CategoriesModel>> fetchCategories()async{

    final fetchData = await localCategoryDb
        .select(localCategoryDb.categoriesLocalDataSource)
        .get();

    final category = fetchData
        .map(
          (data) => CategoriesModel(
        id: data.id,
        name: data.name,
        icon: data.icon,
        isSelected: data.isSelected,
      ),
    )
        .toList();
    return category;
}


}



final addCategoryNotifierProvider =
    AsyncNotifierProvider<AddCategoriesNotifier, List<CategoriesModel>>(
      () => AddCategoriesNotifier(),
    );
