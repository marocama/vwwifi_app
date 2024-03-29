class User {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String phone;
  final DateTime expire;
  final String photoUrl;
  final String accountType;
  final int maxDevices;
  final List devices;

  User({ this.uid, this.name, this.email, this.password, this.phone, this.expire, this.photoUrl, this.accountType, this.devices, this.maxDevices });
  
  User.fromData(Map<String, dynamic> data) : 
    uid         = data['uid'],
    name        = data['name'],
    email       = data['email'],
    password    = data['password'],
    phone       = data['phone'],
    expire      = data['expire'].toDate(),
    photoUrl    = data['photoUrl'],
    accountType = data['accountType'],
    maxDevices  = data['maxDevices'],
    devices     = data['devices'];

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      "uid"         : this.uid,
      "name"        : this.name,
      "email"       : this.email,
      "password"    : this.password,
      "phone"       : this.phone,
      "expire"      : this.expire,
      "photoUrl"    : this.photoUrl,
      "accountType" : this.accountType,
      "maxDevices"  : this.maxDevices,
      "devices"     : this.devices,
    };
  
    return map;
  }
} 