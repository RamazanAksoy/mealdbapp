// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResUserData _$ResUserDataFromJson(Map<String, dynamic> json) => ResUserData(
      id: json['id'] as String?,
      author: json['author'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      downloadUrl: json['download_url'] as String?,
    );

Map<String, dynamic> _$ResUserDataToJson(ResUserData instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'download_Url': instance.downloadUrl,
    };
