// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brochure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brochure _$BrochureFromJson(Map<String, dynamic> json) => Brochure(
      id: json['id'] as int?,
      file: json['file'] as String?,
      image: json['image'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$BrochureToJson(Brochure instance) => <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'image': instance.image,
      'label': instance.label,
    };
