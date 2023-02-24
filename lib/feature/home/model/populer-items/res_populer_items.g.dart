// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_populer_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResPopulerItems _$ResPopulerItemsFromJson(Map<String, dynamic> json) =>
    ResPopulerItems(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResPopulerItemsToJson(ResPopulerItems instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };
