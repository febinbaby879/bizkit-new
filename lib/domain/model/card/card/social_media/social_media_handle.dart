import 'package:json_annotation/json_annotation.dart';

part 'social_media_handle.g.dart';

@JsonSerializable()
class SocialMediaHandle {
  int? id;
  String? label;
  @JsonKey(name: 'social_media')
  String? socialMedia;

  SocialMediaHandle({this.id, this.label, this.socialMedia});

  factory SocialMediaHandle.fromJson(Map<String, dynamic> json) {
    return _$SocialMediaHandleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialMediaHandleToJson(this);
}
