// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archeived_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArcheivedCard _$ArcheivedCardFromJson(Map<String, dynamic> json) =>
    ArcheivedCard(
      isActive: json['is_active'] as bool?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      logo: json['logo'] as String?,
      company: json['company'] as String?,
      isDefault: json['is_default'] as bool?,
      isArchived: json['is_archived'] as bool?,
      views: json['views'] as int?,
      share: json['share'] as int?,
      isVerified: json['is_verified'] as bool?,
      userId: json['user_id'] as int?,
      personalDetailsId: json['personal_details_id'] as int?,
      businessDetailsId: json['business_details_id'] as int?,
      cardLink: json['card_link'] as String?,
    );

Map<String, dynamic> _$ArcheivedCardToJson(ArcheivedCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'designation': instance.designation,
      'logo': instance.logo,
      'company': instance.company,
      'is_default': instance.isDefault,
      'is_archived': instance.isArchived,
      'is_active': instance.isActive,
      'views': instance.views,
      'share': instance.share,
      'is_verified': instance.isVerified,
      'user_id': instance.userId,
      'personal_details_id': instance.personalDetailsId,
      'business_details_id': instance.businessDetailsId,
      'card_link': instance.cardLink,
    };
