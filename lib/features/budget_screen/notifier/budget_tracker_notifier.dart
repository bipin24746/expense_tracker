import 'package:expense_tracker/features/budget_screen/data/model/budget_tracker_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetTrackerNotifier extends Notifier<List<BudgetTrackerModel>> {
  @override
  List<BudgetTrackerModel> build() {
    return [];
  }

  void add({
    required String category,
    required int amount,
    required String type,
    String? notes,
  }) {
    final budgetTracker = BudgetTrackerModel(type, amount, category, notes!);
    state = [...state,budgetTracker];
  }

}

final budgetNotifierProvider =
    NotifierProvider<BudgetTrackerNotifier, List<BudgetTrackerModel>>(
      () => BudgetTrackerNotifier(),
    );
