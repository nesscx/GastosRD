import 'package:gastos_rd/json/company_response.dart';
import 'package:gastos_rd/models/company_expenses.dart';

class Company {
  String rnc;
  String serviceName;
  String userEmail;

  Company({
    this.rnc,
    this.serviceName,
    this.userEmail,
  });

  Company.fromResponse(CompanyResponse response)
      : rnc = response.rnc,
        serviceName = response.serviceName,
        userEmail = response.userEmail;
}