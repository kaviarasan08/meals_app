import 'package:flutter/material.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Map<Filter, bool> kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarianFree: false,
  Filter.veganFree: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  var activePageTitle = 'Your Category';

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // final List<Meal> _favouriteMeal = [];
  // void _toggleFavouriteMealStatus(Meal meal) {
  //   final isexisting = _favouriteMeal.contains(meal);
  //   if (isexisting) {
  //     setState(() {
  //       _favouriteMeal.remove(meal);
  //       _showInfoMessage('Your favourites is removed..');
  //     });
  //   } else {
  //     setState(() {
  //       _favouriteMeal.add(meal);
  //       _showInfoMessage('Added to your favourites.');
  //     });
  //   }
  // }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filterMealsProvider);

    Widget activePage = CategoriesScreen(
      filteredMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      final favouriteMeal = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meal: favouriteMeal,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: const Color.fromARGB(255, 164, 110, 84),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
