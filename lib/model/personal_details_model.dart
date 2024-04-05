class PersonalDetailsModel{
  String travelName;
  String pincode;
  String state;
  String city;

  String email;
  String name;
  String country;
  String district;
  PersonalDetailsModel({
    required this.travelName,
    required this.pincode,
    required this.state,
    required this.city,

    required this.email,
    required this.name,
    required this.country,
    required this.district,
  });


  Map<String, dynamic> toJson() {
    return {
      "travelName": travelName,
      "pincode": pincode,
      "state": state,
      "city": city,
   
      "email": email,
      "name": name,
      "country": country,
      "district": district,
    };
  }

  factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) {
    return PersonalDetailsModel(
      travelName: json["travelName"],
      pincode: json["pincode"],
      state: json["state"],
      city: json["city"],
   
      email: json["email"],
      name: json["name"],
      country: json["country"],
      district: json["district"],
    );
  }

  

}



