class ExpenseModel {
  int? expId;
  DateTime expTime;
  String expType;
  String expCost;

  ExpenseModel(
      {this.expId,
      required this.expTime,
      required this.expType,
      required this.expCost});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expId': expId,
      'expType': expType,
      'expCost': expCost,
      'expTime': expTime
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) => ExpenseModel(
      expTime: map['expTime'],
      expType: map['expType'],
      expCost: map['expCost'],
      expId: map['expId']);
}
