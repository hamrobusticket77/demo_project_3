class ProfileModel {
  String? travelName;
  String? phone;
  String? email;
  String? name;
  String? status;
  String? images;
  ProfileModel(
      {required this.travelName,
      required this.phone,
      required this.email,
      required this.name,
      required this.status,
      required this.images});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    travelName = json['travelName'] ?? '';
    phone = (json['phone']).toString();
    email = json['email'] ?? '';
    name = json['name'] ?? '';
    status = json['status'] ?? '';
    images = json['images'] ?? '';
  }

  ProfileModel copyWith({
    String? travelName,
    String? phone,
    String? email,
    String? name,
    String? status,
    String? images,
  }) {
    return ProfileModel(
        travelName: travelName ?? this.travelName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        name: name ?? this.name,
        status: status ?? this.status,
        images: images ?? this.images);
  }
}
// {
//     "travelName": "Ritesh Jung lama",
//     "phone": 9779865381790,
//     "email": "riteshlama000@gmail.com",
//     "name": "Ritesh Jung lama",
//     "status": "pending",
//     "images": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvh61dMSiACmZo833XOZOUtTMZbXPGdvP35IGcBVw2aQ&s"
// }