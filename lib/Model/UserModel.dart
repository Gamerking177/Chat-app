class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? about;
  String? createdAt;
  String? lastonlineStatus;
  String? status;
  String? role;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.phoneNumber,
    this.about,
    this.createdAt,
    this.lastonlineStatus,
    this.status,
    this.role,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["profileImage"] is String) {
      profileImage = json["profileImage"];
    }
    if (json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if (json["About"] is String) {
      about = json["About"];
    }
    if (json["CreatedAt"] is String) {
      createdAt = json["CreatedAt"];
    }
    if (json["LastonlineStatus"] is String) {
      lastonlineStatus = json["LastonlineStatus"];
    }
    if (json["Status"] is String) {
      status = json["Status"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["profileImage"] = profileImage;
    _data["phoneNumber"] = phoneNumber;
    _data["About"] = about;
    _data["CreatedAt"] = createdAt;
    _data["LastonlineStatus"] = lastonlineStatus;
    _data["Status"] = status;
    _data["role"] = role;
    return _data;
  }
}
