class BusAddModel{
  String name;
  String busNumber;
  String busType;
  List<String> amenities;
  String insuranceName;
  String travelInsurance;
  String insuranceIssueDate;
  String insuranceExpiryDate;
  String roadTaxIssueDate;
  String roadTaxExpiryDate;
  


  BusAddModel({
    required this.name,
    required this.busNumber,
    required this.busType,
    required this.amenities,
    required this.insuranceName,
    required this.travelInsurance,
    required this.insuranceIssueDate,
    required this.insuranceExpiryDate,
    required this.roadTaxIssueDate,
    required this.roadTaxExpiryDate,
  });


  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "busNumber": busNumber,
      "busType": busType,
      "amenities": amenities,
      "insuranceName": insuranceName,
      "travelInsurance": travelInsurance,
      "insuranceIssueDate": insuranceIssueDate,
      "insuranceExpiryDate": insuranceExpiryDate,
      "roadTaxIssueDate": roadTaxIssueDate,
      "roadTaxExpiryDate": roadTaxExpiryDate,
    };
  }


  factory BusAddModel.fromJson(Map<String, dynamic> json) {
    return BusAddModel(
      name: json['name'],
      busNumber: json['busNumber'],
      busType: json['busType'],
      amenities: List<String>.from(json['amenities']),
      insuranceName: json['insuranceName'],
      travelInsurance: json['travelInsurance'],
      insuranceIssueDate: json['insuranceIssueDate'],
      insuranceExpiryDate: json['insuranceExpiryDate'],
      roadTaxIssueDate: json['roadTaxIssueDate'],
      roadTaxExpiryDate: json['roadTaxExpiryDate'],
    );
  }

}


// {
//     "name":"Ritesh Jung Lama",
//     "busNumber":"22121212121",
//     "busType":"Bus type",
//     "amenities":["wifi","ac","tv"],
//     "insuranceName":"Relieice Insurance",
//     "travelInsurance":"Relience Insurance",
//     "insuranceIssueDate":"2024-02-02",
//     "insuranceExpiryDate":"2024-02-02",
//     "roadTaxIssueDate":"2024-02-02",
//     "roadTaxExpiryDate":"2024-02-02"
// }