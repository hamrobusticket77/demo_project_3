class BankDetailsModel {
  String bankName;
  String accountNumber;
  String beneficaryName;
  String bankaccountType;
  String citizenshipNumber;


  BankDetailsModel({
    required this.bankName,
    required this.accountNumber,
    required this.beneficaryName,
    required this.bankaccountType,
    required this.citizenshipNumber,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankName'] = bankName;
    data['accountNumber'] = accountNumber;
    data['beneficaryName'] = beneficaryName;
    data['bankaccountType'] = bankaccountType;
    data['citizenshipNumber'] = citizenshipNumber;
    return data;
  }

  factory BankDetailsModel.fromJson(Map<String, dynamic> json) {
    return BankDetailsModel(
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      beneficaryName: json['beneficaryName'],
      bankaccountType: json['bankaccountType'],
      citizenshipNumber: json['citizenshipNumber'],
    );
  }

  
}
