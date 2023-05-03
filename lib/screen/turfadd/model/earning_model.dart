class EarningReport {
  DateTime id;
  int totalPrice;
  int count;

  EarningReport(
      {required this.id, required this.totalPrice, required this.count});

  factory EarningReport.fromJson(Map<String, dynamic> json) {
    return EarningReport(
      id: DateTime.parse(json['_id']),
      totalPrice: json['totalPrice'],
      count: json['count'],
    );
  }
}
