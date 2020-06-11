/*class User {
  String uid;
  String name;
  String email;
  String password;
  String phone;
  String photoUrl;
  
  User({this.uid, this.name, this.email, this.phone, this.photoUrl});

  factory User.fromMap(Map data) {
    return User(
      uid: data['uid'],
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
    {"uid": uid, "name": name, "email": email, "phone": phone, "photoUrl": photoUrl};
}*/

class User {
  String _uid;
  String _name;
  String _email;
  String _password;
  String _phone;
  String _photoUrl;
  String _accountType;
  String _expire;
  int _maxGuests;


  /*
  fromMap(Map data) {
    User user = User();

    user._uid = data['uid'];
    user.

    return user;
  }*/
  

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      "uid"      : this._uid,
      "name"     : this._name,
      "email"    : this._email,
      "phone"    : this._phone,
      "photoUrl" : this._photoUrl,
    };
  
    return map;
  }

  
  String get name => _name;

  set name(String value) { _name = value; }

  String get email => _email;

  set email(String value) { _email = value; }

  String get password => _password;

  set password(String value) { _password = value; }

  String get phone => _phone;

  set phone(String value) { _phone = value; }

  String get photoUrl => _photoUrl;

  set photoUrl(String value) { _photoUrl = value; }
} 