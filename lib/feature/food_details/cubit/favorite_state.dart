import '../../home/model/random-food/meals.dart';

class FavoriteState {
  final bool? isFavorite;
  final List<Meals>? meals;

  FavoriteState({this.meals, this.isFavorite});

  FavoriteState copyWith({
    bool? isFavorite,
    List<Meals>? meals,
  }) {
    return FavoriteState(
      isFavorite: isFavorite ?? this.isFavorite,
      meals: meals ?? this.meals,
    );
  }
}
