// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_expenses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyExpensesResponse _$CompanyExpensesResponseFromJson(
    Map<String, dynamic> json) {
  return new CompanyExpensesResponse(
      rncSupplier: json['rnc_supplier'] as String,
      ncf: json['ncf'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      total: (json['total'] as num)?.toDouble(),
      itbis: (json['itbis'] as num)?.toDouble(),
      imageUri: json['image_uri'] as String,
      purchaseConcept: json['purchase_concept'] as String,
      companyRnc: json['company_rnc'] as String);
}

Map<String, dynamic> _$CompanyExpensesResponseToJson(
        CompanyExpensesResponse instance) =>
    <String, dynamic>{
      'rnc_supplier': instance.rncSupplier,
      'ncf': instance.ncf,
      'date': instance.date?.toIso8601String(),
      'total': instance.total,
      'itbis': instance.itbis,
      'image_uri': instance.imageUri,
      'purchase_concept': instance.purchaseConcept,
      'company_rnc': instance.companyRnc
    };
