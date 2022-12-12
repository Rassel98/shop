class CustomerModel {
  String? customerId;
  String customerName;
  String customerMobileNumber;
  String customerAddress;

  CustomerModel(
      {this.customerId,
      required this.customerName,
      required this.customerMobileNumber,
      required this.customerAddress});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerId': customerId,
      'customerName': customerName,
      'customerMobileNumber': customerMobileNumber,
      'customerAddress': customerAddress
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) => CustomerModel(
      customerId: map['customerId'],
      customerName: map['customerName'],
      customerMobileNumber: map['customerMobileNumber'],
      customerAddress: map['customerAddress']);
}
