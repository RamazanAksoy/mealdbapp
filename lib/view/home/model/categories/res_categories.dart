import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';
import 'categories.dart';
part 'res_categories.g.dart';

@JsonSerializable()
class ResCategories extends BaseModel<ResCategories> {
  final List<Categories>? categories;

  factory ResCategories.fromJson(Map<String, dynamic> json) => _$ResCategoriesFromJson(json);

  ResCategories({this.categories});

  @override
  Map<String, dynamic> toJson() => _$ResCategoriesToJson(this);

  @override
  ResCategories fromJson(Map<String, dynamic> json) {
    return ResCategories.fromJson(json);
  }
}
