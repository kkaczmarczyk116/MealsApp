import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/Meal.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>> {
  FavMealsNotifier() : super([]);

  bool toggleMealFavStatus(Meal meal) {
    //not allowed to reach to the list and use add/remove
    //state property hold your data, list of Meal 's
    final mealIsFav = state.contains(meal);

    if (mealIsFav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal]; //without editing exsisting memory
      return true;
    }
  }
}

final FavMealsProvider = StateNotifierProvider<FavMealsNotifier, List<Meal>>(
    (ref) => FavMealsNotifier());// StateNotifierProvider needs Notifier