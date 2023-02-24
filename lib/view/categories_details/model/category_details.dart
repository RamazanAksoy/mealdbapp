import 'package:json_annotation/json_annotation.dart';

part 'category_details.g.dart';
@JsonSerializable()
class CategoryDetails {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  CategoryDetails({this.strMeal, this.strMealThumb, this.idMeal});

  factory CategoryDetails.fromJson(Map<String, dynamic> json) => _$CategoryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailsToJson(this);
}

