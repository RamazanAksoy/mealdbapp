import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';

@JsonSerializable()
class Categories {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  Categories(this.idCategory, this.strCategory, this.strCategoryThumb, this.strCategoryDescription);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
