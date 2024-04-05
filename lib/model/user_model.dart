

class UserModel {
  String? ownerId;
  String? token;
  Owner? owner;

  UserModel({this.ownerId, this.token, this.owner});

  UserModel.fromJson(Map<String, dynamic> json) {
    ownerId = json['ownerId'];
    token = json['token'];
    owner = json['owner'] != null ?  Owner.fromJson(json['owner']) : null;
  }

  
}

class Owner {
  String? id;
  int? phone;
  String? country;
  String? status;
  String? vendorDetail;
  String? rejectionReason;
  String? role;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  int? v;

  Owner(
      {this.id,
      this.phone,
      this.country,
      this.status,
      this.vendorDetail,
      this.rejectionReason,
      this.role,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.v});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    phone = json['phone'];
    country = json['country'];
    status = json['status'];
    vendorDetail = json['vendorDetail'];
    rejectionReason = json['rejectionReason'];
    role = json['role'];
    images = json['images'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}
