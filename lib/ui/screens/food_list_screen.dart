import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:JapanEatProject/ui/extensions/app_extension.dart';
import 'package:JapanEatProject/ui/widgets/food_list_view.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui_kit/_ui_kit.dart';
import '../../data/app_data.dart';
// import 'package:flutter_project/data/app_data.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<StatefulWidget> createState() => FoodListState();
}

class FoodListState extends State<FoodList> {
  var categories = AppData.categories;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Morning, Mavile",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "What do you want to eat \ntoday",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              _searchBar(),
              Text(
                "Available for you",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              _categories(),
              FoodListView(foods: AppData.foodItems),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best food of the week",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "See all",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: LightThemeColor.accent),
                      ),
                    ),
                  ],
                ),
              ),
              FoodListView(foods: AppData.foodItems, isReversed: true),
            ],
          ),
        ),
      ));
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.dice),
        onPressed: () {},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined, color: LightThemeColor.accent),
          Text(
            "Location",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            badgeStyle: const BadgeStyle(badgeColor: LightThemeColor.accent),
            badgeContent: const Text(
              "2",
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topStart(start: -3),
            child: const Icon(Icons.notifications_none, size: 30),
          ),
        )
      ],
    );
  }

  Widget _searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search food',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = AppData.categories[index];
              return GestureDetector(
                onTap: () {
                  onCategoryTap(index);
                },
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: category.isSelected
                        ? LightThemeColor.accent
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    category.type.name.toCapital,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => Container(
                  width: 15,
                ),
            itemCount: AppData.categories.length),
      ),
    );
  }

  void onCategoryTap(int selectedIndex) {
    //Меняем выбранную категорию
    // AppData.categories.asMap().forEach((index, category) {
    //   category.isSelected = index == selectedIndex;
    // });
    for (int i = 0; i < AppData.categories.length; i++) {
      AppData.categories[i].isSelected = i == selectedIndex;
    }
    // AppData.categories[selectedIndex].isSelected = true;
    setState(() {});
  }
}
