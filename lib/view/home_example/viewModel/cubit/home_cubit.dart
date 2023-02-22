import 'package:bloc/bloc.dart';
import 'package:mealdbapp/view/home/model/categories/res_categories.dart';
import 'package:mealdbapp/view/home/model/populer-items/res_populer_items.dart';
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';
import 'package:mealdbapp/view/home_example/model/categories/res_categories.dart';
import 'package:mealdbapp/view/home_example/viewModel/service/home_service.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class ExHomeCubit extends Cubit<ExHomeState> {
  ExHomeCubit() : super(HomeInitial()) {
    _init();
  }

  final ExHomeService homeService = ExHomeService();

  bool isCategoriesLoading = false;
  bool isPopularItemsLoading = false;
  bool isFoodLoading = false;

  ExResCategories? resCategories;
  ResPopulerItems? resPopulerItems;
  ResFoodDetails? resFoodDetails;

  categoriesLoading() {
    isCategoriesLoading = !isCategoriesLoading;
    emit(CategoryLoading());
  }

  popularItemsLoading() {
    isPopularItemsLoading = !isPopularItemsLoading;
    emit(PopularItemsLoading());
  }

  randomFoodLoading() {
    isFoodLoading = !isFoodLoading;
    emit(RandomFoodLoading());
  }

  Future loadCategories() async {
    categoriesLoading();
    resCategories = (await homeService.getCategories())?.data;
    print(resCategories!.categories!.length);
    categoriesLoading();
    emit(CategoryService());
  }

  Future loadPopularItems() async {
    popularItemsLoading();
    resPopulerItems = (await homeService.getPopulerItems())?.data;
    print(resPopulerItems!.meals!.length);
    popularItemsLoading();
    emit(PopularItemsService());
  }

  Future loadRandomFood() async {
    randomFoodLoading();
    resFoodDetails = (await homeService.getRandomFood())?.data;
    print(resFoodDetails!.meals!.length);
    randomFoodLoading();
    emit(RandomFoodService());
  }

  _init() {
    loadCategories();
    loadPopularItems();
    loadRandomFood();

    categoriesLoading();
    popularItemsLoading();
    randomFoodLoading();
  }
}
