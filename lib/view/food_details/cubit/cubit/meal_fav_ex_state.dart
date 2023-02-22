part of 'meal_fav_ex_cubit.dart';

@immutable
abstract class MealFavExState {}

class MealFavExInitial extends MealFavExState {}

//Favori Buttonun kontrolü
class MealFavExButtonControlState extends MealFavExState {}

//Yüklenmeme durumunda error sayfasına düşmesi
class MealFavExErrorWidgetState extends MealFavExState {}

//Servisten çekilip çekilmediğini kontrol et
class MealFavExService extends MealFavExState {}
