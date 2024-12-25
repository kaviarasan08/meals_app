import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarianFree: false,
          Filter.veganFree: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  //state[filter] = isActive ; //is not Allowed =>mutating the states

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive, //it will override the existing filter
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filterMealsProvider = Provider((ref) {

  final meals = ref.watch(mealsProvider);
  final availableFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
      if (availableFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (availableFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (availableFilters[Filter.vegetarianFree]! && !meal.isVegetarian) {
        return false;
      }
      if (availableFilters[Filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});
