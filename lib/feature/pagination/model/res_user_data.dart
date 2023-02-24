import 'package:json_annotation/json_annotation.dart';
import 'package:mealdbapp/core/base/model/base_model.dart';
part 'res_user_data.g.dart';

@JsonSerializable()
class ResUserData extends BaseModel<ResUserData> {
  final String? id;
  final String? author;
  final int? width;
  final int? height;
  final String? url;
  @JsonKey(name: "download_Url")
  final String? downloadUrl;

  ResUserData({this.id, this.author, this.width, this.height, this.url, this.downloadUrl});

  factory ResUserData.fromJson(Map<String, dynamic> json) => _$ResUserDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResUserDataToJson(this);

  @override
  ResUserData fromJson(Map<String, dynamic> json) {
    return ResUserData.fromJson(json);
  }
}
