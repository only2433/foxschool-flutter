// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CompanyInformation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyInformationImpl _$$CompanyInformationImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyInformationImpl(
      ceo: json['ceo'] as String? ?? "",
      address: json['address'] as String? ?? "",
      companyRegistrationNumber: json['brn'] as String? ?? "",
      salesRegistration: json['mosrn'] as String? ?? "",
      electronicPublication: json['ecn_number'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      fax: json['fax'] as String? ?? "",
    );

Map<String, dynamic> _$$CompanyInformationImplToJson(
        _$CompanyInformationImpl instance) =>
    <String, dynamic>{
      'ceo': instance.ceo,
      'address': instance.address,
      'brn': instance.companyRegistrationNumber,
      'mosrn': instance.salesRegistration,
      'ecn_number': instance.electronicPublication,
      'phone': instance.phone,
      'fax': instance.fax,
    };
