import 'package:gastos_rd/json/company_expenses_response.dart';

class CompanyExpenses {
  String rncSupplier;
  String ncf;
  DateTime date;
  double total;
  double itbis;
  String imageUri;
  String purchaseConcept;
  String companyRnc;

  CompanyExpenses({
    this.rncSupplier,
    this.ncf,
    this.date,
    this.total,
    this.itbis,
    this.imageUri,
    this.purchaseConcept,
    this.companyRnc,
  });

  CompanyExpenses.fromResponse(CompanyExpensesResponse response)
      : rncSupplier = response.rncSupplier,
        ncf = response.ncf,
        date = response.date,
        total = response.total,
        itbis = response.itbis,
        imageUri = response.imageUri,
        purchaseConcept = response.purchaseConcept,
        companyRnc = response.companyRnc;
}