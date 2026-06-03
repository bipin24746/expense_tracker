import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'categories_local_data_source.g.dart';

class CategoriesLocalDataSource extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  TextColumn get icon => text().named('icon')();
  BoolColumn get isSelected => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [CategoriesLocalDataSource])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'expense_tracker');
  }

  @override
  int get schemaVersion => 1;

  Future<void> addCategory({
    required String name,
    required String icon,
  }) {
    return into(categoriesLocalDataSource).insert(
      CategoriesLocalDataSourceCompanion.insert(
        name: name,
        icon: icon,
      ),
    );
  }

  Future<void> deleteCategory({required String name}) {
    return (delete(categoriesLocalDataSource)
      ..where((t) => t.name.equals(name)))
        .go();
  }

  // ✅ FIXED SELECT CATEGORY
  Future<void> selectCategory(String name) async {
    // reset all
    await (update(categoriesLocalDataSource)).write(
      const CategoriesLocalDataSourceCompanion(
        isSelected: Value(false),
      ),
    );

    // select one
    await (update(categoriesLocalDataSource)
      ..where((t) => t.name.equals(name)))
        .write(
      const CategoriesLocalDataSourceCompanion(
        isSelected: Value(true),
      ),
    );
  }
}