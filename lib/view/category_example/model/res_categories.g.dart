// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResCategories _$ResCategoriesFromJson(Map<String, dynamic> json) =>
    ResCategories(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResCategoriesToJson(ResCategories instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
