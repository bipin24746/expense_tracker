import 'package:drift/drift.dart';

class BudgetTrackerDataSource extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().named('type')();
  IntColumn get amount => integer().named('amount')();
  TextColumn get category => text().named('category')();
  TextColumn get notes => text().named('notes')();

}