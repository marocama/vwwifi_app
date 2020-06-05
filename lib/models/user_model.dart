class UserModel {
  String uid;
  String name;
  String email;
  String phone;
  String photoUrl;
  
  UserModel({this.uid, this.name, this.email, this.phone, this.photoUrl});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": uid, "name": name, "email": email, "phone": phone, "photoUrl": photoUrl};
}