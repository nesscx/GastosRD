// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) {
  return new CompanyResponse(
      rnc: json['rnc'] as String,
      serviceName: json['service_name'] as String,
      userEmail: json['user_email'] as String);
}

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'rnc': instance.rnc,
      'service_name': instance.serviceName,
      'user_email': instance.userEmail
    };
