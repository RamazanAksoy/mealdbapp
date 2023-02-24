
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';
import 'category_details.dart';

part 'res_category_details.g.dart';

@JsonSerializable()
class ResCategoryDetails extends BaseModel<ResCategoryDetails> {
  final List<CategoryDetails>? meals;

  ResCategoryDetails({this.meals});

  factory ResCategoryDetails.fromJson(Map<String, dynamic> json) =>
      _$ResCategoryDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResCategoryDetailsToJson(this);

  @override
  ResCategoryDetails fromJson(Map<String, dynamic> json) {
    return ResCategoryDetails.fromJson(json);
  }
}
