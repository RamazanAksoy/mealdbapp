import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';
import 'items.dart';

part 'res_populer_items.g.dart';

@JsonSerializable()
class ResPopulerItems extends BaseModel<ResPopulerItems> {
  final List<Items>? meals;

  ResPopulerItems({this.meals});

  factory ResPopulerItems.fromJson(Map<String, dynamic> json) => _$ResPopulerItemsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResPopulerItemsToJson(this);

  @override
  ResPopulerItems fromJson(Map<String, dynamic> json) {
    return ResPopulerItems.fromJson(json);
  }
}
