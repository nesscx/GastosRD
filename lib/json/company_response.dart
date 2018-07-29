import 'package:json_annotation/json_annotation.dart';

part 'company_response.g.dart';

@JsonSerializable()
class CompanyResponse extends Object {
  String rnc;
  @JsonKey(name: 'service_name')
  String serviceName;
  @JsonKey(name: 'user_email')
  String userEmail;

  CompanyResponse({
    this.rnc,
    this.serviceName,
    this.userEmail,
  });

  factory CompanyResponse.fromJson(Map<String, dynamic> json) => _$CompanyResponseFromJson(json);
}