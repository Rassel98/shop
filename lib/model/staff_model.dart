class StaffModel {
  int? id;
  String? staffId;
  String staffName;
  String staffMobileNumber;
  int? staffSalary;
  num? staffComition;
  DateTime? joinDate;

  StaffModel(
      {this.staffId,
      this.id,
      required this.staffName,
      required this.staffMobileNumber,
      this.staffSalary,
      this.staffComition,
      this.joinDate});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'staffId': staffId,
      'staffName': staffName,
      'staffMobileNumber': staffMobileNumber,
      'staffComition': staffComition,
      'staffSalary': staffSalary,
      'joinDate': joinDate,
    };
  }

  factory StaffModel.fromMap(Map<String, dynamic> map) => StaffModel(
      id: map['id'],
      staffId: map['staffId'],
      staffName: map['staffName'],
      staffMobileNumber: map['staffMobileNumber'],
      staffComition: map['staffComition'],
      staffSalary: map['staffSalary']);
}
