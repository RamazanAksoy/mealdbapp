part of 'home_cubit.dart';

@immutable
abstract class ExHomeState {}

class HomeInitial extends ExHomeState {}

//#Category
class CategoryLoading extends ExHomeState{}
class CategoryService extends ExHomeState{}

//#PopularItems
class PopularItemsLoading extends ExHomeState{}
class PopularItemsService extends ExHomeState{}

//#RandomFood
class RandomFoodLoading extends ExHomeState{}
class RandomFoodService extends ExHomeState{}
