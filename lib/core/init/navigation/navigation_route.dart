import 'package:flutter/material.dart';
import 'package:mealdbapp/view/food_details/view/food_details.dart';

import '../../../view/categories_details/view/categories_detail.dart';
import '../../../view/widget/bottom_navigation_bar.dart';
import '../../components/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const Tabbar(), NavigationConstants.DEFAULT);

      case NavigationConstants.CATEGORY_DETAILS:
        return normalNavigate(
            CategoriesDetailsScreen(
              categoryName: args.arguments.toString(),
            ),
            NavigationConstants.CATEGORY_DETAILS);

      case NavigationConstants.FOOD_DETAIL:
        return normalNavigate(
            FoodDetailsScreen(
              foodId: int.parse(args.arguments.toString()),
            ),
            NavigationConstants.CATEGORY_DETAILS);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}
