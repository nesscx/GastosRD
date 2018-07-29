class CompanyExpenses {
  int id;
  String rncSupplier;
  String ncf;
  DateTime date;
  double total;
  double itbis;
  String imageUri;
  String purchaseConcept;

  CompanyExpenses({
    this.id,
    this.rncSupplier,
    this.ncf,
    this.date,
    this.total,
    this.itbis,
    this.imageUri,
    this.purchaseConcept,
  });
}