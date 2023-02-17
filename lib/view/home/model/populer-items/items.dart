import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;
  final String? strType;

  Items({this.idIngredient, this.strIngredient, this.strDescription, this.strType});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
