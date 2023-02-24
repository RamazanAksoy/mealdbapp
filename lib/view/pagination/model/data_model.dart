import 'package:json_annotation/json_annotation.dart';
import 'package:mealdbapp/core/base/model/base_model.dart';

part 'data_model.g.dart';

@JsonSerializable()
class UserData extends BaseModel<UserData>{
  final String? id;
  final String? author;
  final int? width;
  final int? height;
  final String? url;
  @JsonKey(name: "download_Url")
  final String? downloadUrl;

  UserData(
      {this.id,
      this.author,
      this.width,
      this.height,
      this.url,
      this.downloadUrl});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  UserData fromJson(Map<String, dynamic> json) {
    return UserData.fromJson(json);
  }
}
