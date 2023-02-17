import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';
import 'meals.dart';

part 'res_food_details.g.dart';

@JsonSerializable()
class ResFoodDetails extends BaseModel<ResFoodDetails> {
  final List<Meals>? meals;

  ResFoodDetails({this.meals});

  factory ResFoodDetails.fromJson(Map<String, dynamic> json) => _$ResFoodDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResFoodDetailsToJson(this);

  @override
  ResFoodDetails fromJson(Map<String, dynamic> json) {
    return ResFoodDetails.fromJson(json);
  }
}
