// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetailsCreate _$BankDetailsCreateFromJson(Map<String, dynamic> json) =>
    BankDetailsCreate(
      nameOfCompany: json['name_of_company'] as String?,
      acccountNumber: json['account_number'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      upiDetails: json['upi_details'] as String?,
      gstMembershipDetails: json['gst_membership_details'] as String?,
      branchOffices: json['branch_offices'] as String?,
    );

Map<String, dynamic> _$BankDetailsCreateToJson(BankDetailsCreate instance) =>
    <String, dynamic>{
      'name_of_company': instance.nameOfCompany,
      'account_number': instance.acccountNumber,
      'ifsc_code': instance.ifscCode,
      'upi_details': instance.upiDetails,
      'gst_membership_details': instance.gstMembershipDetails,
      'branch_offices': instance.branchOffices,
    };
