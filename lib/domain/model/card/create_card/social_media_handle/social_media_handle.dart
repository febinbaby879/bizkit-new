import 'package:json_annotation/json_annotation.dart';

part 'social_media_handle.g.dart';

@JsonSerializable()
class SocialMediaHandleCreate {
  String? label;
  @JsonKey(name: 'social_media')
  String? socialMedia;

  SocialMediaHandleCreate({this.label, this.socialMedia});

  factory SocialMediaHandleCreate.fromJson(Map<String, dynamic> json) {
    return _$SocialMediaHandleCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialMediaHandleCreateToJson(this);

  SocialMediaHandleCreate copyWith({
    String? label,
    String? socialMedia,
  }) {
    return SocialMediaHandleCreate(
      label: label ?? this.label,
      socialMedia: socialMedia ?? this.socialMedia,
    );
  }
}
