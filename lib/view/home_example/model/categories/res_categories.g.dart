// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExResCategories _$ExResCategoriesFromJson(Map<String, dynamic> json) =>
    ExResCategories(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExResCategoriesToJson(ExResCategories instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
