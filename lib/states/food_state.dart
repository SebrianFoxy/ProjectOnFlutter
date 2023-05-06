import '../data/app_data.dart';
import '../data/models/food_category.dart';
import '../data/models/food.dart';

class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;
  int _currentIndex = 0; //Индекс табнавигации.
  int get currentIndex => _currentIndex;

  Map<int, Food> foods = Map.fromEntries(AppData.foodItems.map((food) => MapEntry(food.id, food)));
  List<int> foodIds = AppData.foodItems.expand((food) => [food.id]).toList();
  List<int> foodIdsByCategory = AppData.foodItems.expand((food) => [food.id]).toList();

  List<FoodCategory> _categories = AppData.categories;
  List<FoodCategory> get categories => _categories;
  List<int> cartIds = [];

  int _selectedCategoryIndex = 0;
  int selectedFoodId = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  Future<void> onCategoryTap(int selectedIndex) async {
    if (_selectedCategoryIndex == selectedIndex) return;
    //Меняем выбранную категорию
    _selectedCategoryIndex = selectedIndex;
    _categories.asMap().forEach((index, category) {
      category.isSelected = index == selectedIndex;
    });
    if (_selectedCategoryIndex == 0) {
      foodIdsByCategory = foodIds;
    } else {
      foodIdsByCategory = foods.entries
          .where((foodEntry) => (foodEntry.value.type ==
              _categories[_selectedCategoryIndex].type))
          .expand((foodEntry) => [foodEntry.value.id])
          .toList();
    }
  }
  Food foodById(int id) {
    return foods[id] ?? AppData.foodItems[0];
  }
  Future<void> onFoodTap(int id) async {
    selectedFoodId = id;
  }

}
