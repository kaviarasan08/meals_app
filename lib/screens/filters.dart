import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     if (identifier == 'Filters') {
      //       Navigator.of(context).pop();
      //     } else {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const TabsScreen()),);
      //     }
      //   },
      // ),
      // body: PopScope(
      //   canPop: true,
      //   onPopInvokedWithResult: (didPop, result) async {
      //     // Navigator.of(context).pop({
      //     //   Filter.glutenFree: _glutenFreeFilterSet,
      //     //   Filter.lactoseFree: _lactoseFreeFilterSet,
      //     //   Filter.vegetarianFree: _veganFreeFilterSet,
      //     //   Filter.veganFree: _veganFreeFilterSet,
      //     // });
      //     ref.read(filtersProvider.notifier).setFilters({
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactoseFree: _lactoseFreeFilterSet,
      //       Filter.vegetarianFree: _vegetarianFreeFilterSet,
      //       Filter.veganFree: _veganFreeFilterSet,
      //     });
      //   },
      //   child:
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 24,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 24,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarianFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarianFree, isChecked);
            },
            title: Text(
              'Vegetarian-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian-free meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 24,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.veganFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.veganFree, isChecked);
            },
            title: Text(
              'Vegan-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            subtitle: Text(
              'Only include vegan-free meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 24,
            ),
          ),
        ],
      ),
    );
  }
}
