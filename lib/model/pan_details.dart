//  "panName": "string",
//   "panAddress": "string",
//   "issuedate": "string",
//   "dateofbirth": "string"


class PanDetailsModel {
  String panName;
  String panAddress;
  String issueDate;
  String dob;
 


  PanDetailsModel({
    required this.panName,
    required this.panAddress,
    required this.issueDate,
    required this.dob,
    
  });

  factory PanDetailsModel.fromJson(Map<String, dynamic> json) => PanDetailsModel(
    panName: json["panName"],
    panAddress: json["panAddress"],
    issueDate: json["issueDate"],
    dob: json["dob"],
    
  );

  Map<String, dynamic> toJson() => {
    "panName": panName,
    "panAddress": panAddress,
    "issuedate": issueDate,
    "dateofbirth": dob,
    
  };


}