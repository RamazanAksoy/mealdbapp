// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_category_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResCategoryDetails _$ResCategoryDetailsFromJson(Map<String, dynamic> json) =>
    ResCategoryDetails(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => CategoryDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResCategoryDetailsToJson(ResCategoryDetails instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };
