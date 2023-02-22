import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';
import 'categories.dart';
part 'res_categories.g.dart';

@JsonSerializable()
class ExResCategories extends BaseModel<ExResCategories> {
  final List<Categories>? categories;

  factory ExResCategories.fromJson(Map<String, dynamic> json) => _$ExResCategoriesFromJson(json);

  ExResCategories({this.categories});

  @override
  Map<String, dynamic> toJson() => _$ExResCategoriesToJson(this);

  @override
  ExResCategories fromJson(Map<String, dynamic> json) {
    return ExResCategories.fromJson(json);
  }
}
