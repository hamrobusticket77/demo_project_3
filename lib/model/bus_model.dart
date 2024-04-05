  // {
  //       "_id": "f404040b-de1a-4c4c-89fb-fed997768b5f",
  //       "name": "Ritesh Jung Lama",
  //       "busNumber": "22121212121",
  //       "images": [
  //           "https://imagedelivery.net/-sdbRY-slZbDzF7YIcsg-g/8ecfbebc-c474-4aad-12d7-9f22013fb700/public",
  //           "https://imagedelivery.net/-sdbRY-slZbDzF7YIcsg-g/d243d8a4-9981-4c32-d077-ede737e8ae00/public"
  //       ]
  //   }


  class BusModel{
  String id;
  String name;
  String busNumber;
  List<String> images;


  BusModel({required this.id, required this.name, required this.busNumber, required this.images});

  factory BusModel.fromJson(Map<String, dynamic> json){
    return BusModel(
      id: json['_id'] ,
      name: json['name'] ?? "No Name Found",
      busNumber: json['busNumber'] ?? "No Number Found",
      images: List<String>.from(json['images'])
    );
  }



  }