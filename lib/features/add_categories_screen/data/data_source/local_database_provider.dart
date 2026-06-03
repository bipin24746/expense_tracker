import 'package:expense_tracker/features/add_categories_screen/data/data_source/categories_local_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDatabaseProvider = Provider<AppDatabase>((ref){
  final localDatabase = AppDatabase();

  ref.onDispose((){
    localDatabase.close();
  });

  return localDatabase;
});