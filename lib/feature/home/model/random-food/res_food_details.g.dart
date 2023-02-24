// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_food_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResFoodDetails _$ResFoodDetailsFromJson(Map<String, dynamic> json) =>
    ResFoodDetails(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meals.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResFoodDetailsToJson(ResFoodDetails instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };
