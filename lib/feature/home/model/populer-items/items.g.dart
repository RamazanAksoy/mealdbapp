// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      idIngredient: json['idIngredient'] as String?,
      strIngredient: json['strIngredient'] as String?,
      strDescription: json['strDescription'] as String?,
      strType: json['strType'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'idIngredient': instance.idIngredient,
      'strIngredient': instance.strIngredient,
      'strDescription': instance.strDescription,
      'strType': instance.strType,
    };
