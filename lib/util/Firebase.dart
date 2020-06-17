import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vwwifi/models/User.dart';
import 'package:flutter/services.dart';

class Firebase {

  static Future<String> loginUser(String email, String password) async {

    AuthResult result;

    try {
      result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password);

      return (result.user.isEmailVerified) ? 'Sucesso' : 'Verifique seu email para continuar.';

    } on PlatformException catch (e) {    

      String message = "Erro ao acessar, tente novamente.";

      switch(e.code) {
        case 'ERROR_USER_NOT_FOUND':
          message = "Conta não identificada, tente novamente.";
          break;
        case 'ERROR_WRONG_PASSWORD':
          message = "Credenciais incorretas, tente novamente.";
          break;
        case 'ERROR_INVALID_EMAIL':
          message = "Endereço de email inválido, tente novamente.";
          break;
        case 'ERROR_USER_DISABLED':
          message = "Conta desativada, entre em contato.";
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          message = "Máximo de tentativas atingido.";
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          message = "Conta inativa, entre em contato.";
          break;
      }

      return message;
    }
  }

  static Future<String> registerUser(String email, String password, String name, String phone) async {

    AuthResult result;

    try {
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password);

      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      result.user.updateProfile(info);

      await Firestore.instance.collection("users").document(result.user.uid).setData({
        "email": email, 
        "name": name, 
        "phone": phone, 
        "photoUrl": "",
        "accountType": "Administrador",
        "created_at": DateTime.now(),
        "last_login" : DateTime.now(),
        "expire": DateTime.now().add(Duration(days: 30)),
        "maxDevices": 0,
      });

      result.user.sendEmailVerification();

      return 'Sucesso! Verifique seu email para continuar.';

    } catch (e) {    

      String message = "Erro ao registrar, tente novamente.";

      switch(e.code) {
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          message = "Este email já está associado a outra conta.";
          break;
        case 'ERROR_INVALID_EMAIL':
          message = "Endereço de email inválido, tente novamente";
          break;
        case 'ERROR_WEAK_PASSWORD':
          message = "Senha fraca, tente novamente";
          break;
      }
      
      return message;
    }
  }

  static Future<void> logoutUser() async {

    await FirebaseAuth.instance.signOut();
  }

  static Future<void> lastLogin() async {

    await Firestore.instance.collection("users").document(await getCurrentUser().then((value) => value.uid)).updateData({ "last_login": DateTime.now() });
  }

  static Future<String> recoveryPassword(String email) async {

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());

      return 'Link de recuperação enviado';

    } catch (e) {

      String message = "Erro na recuperação, tente novamente.";

      switch(e.code) {
        case 'ERROR_INVALID_EMAIL':
          message = "Endereço de email inválido, tente novamente";
          break;
        case 'ERROR_USER_NOT_FOUND':
          message = "Conta não encontrada, tente novamente";
          break;
      }
      
      return message;
    }
  }

  static Future<FirebaseUser> getCurrentUser() async {

    return await FirebaseAuth.instance.currentUser();
  }

  static Future<User> getDataLoggedUser() async {

    FirebaseUser firebaseUser = await getCurrentUser();

    DocumentSnapshot snapshot = await Firestore.instance.collection("users").document(firebaseUser.uid).get();
    QuerySnapshot snapshotBrd = await Firestore.instance.collection("users").document(firebaseUser.uid).collection("devices").orderBy("name").getDocuments();

    User user = User(
      uid: firebaseUser.uid,
      name: snapshot.data["name"],
      email: firebaseUser.email,
      phone: snapshot.data["phone"],
      expire: snapshot.data["expire"].toDate(),
      photoUrl: snapshot.data["photoUrl"],
      accountType: snapshot.data["accountType"],
      maxDevices: snapshot.data["maxDevices"],
      devices: snapshotBrd.documents.toList(),
    );
    
    return user;
  }

  static Future<String> registerDevice(String serial, String identify) async {

    DocumentSnapshot snapshot = await Firestore.instance.collection("devices").document(serial).get();

    if(!snapshot.exists) return 'Dispositivo não encontrado';

    if(!snapshot.data["available"]) return 'Dispositivo já vinculado';

    try {

      await Firestore.instance.collection("users").document(await getCurrentUser().then((value) => value.uid)).collection("devices").document(serial).setData({ "name": identify, "registered_at": DateTime.now(), "active": snapshot.data["active"] });
  
      await Firestore.instance.collection("devices").document(serial).updateData({ "available": false });

      return 'Novo dispositivo registrado';

    } catch (e) {

      return 'Erro no registro, tente novamente';
    }
  }

  static Future<DocumentSnapshot> getDataDevice(String serial) async {

    await Firestore.instance.collection("devices").document(serial).updateData({ 
      "protocol": {
        "ENTRADAS": {
          "E1": true,
          "E2": false,
          "E3": true,
          "E4": false,
          "E5": true,
          "E6": false,
          "E7": true,
          "E8": false,
        },
        "SAIDAS": {
          "S1": false,
          "S2": true,
          "S3": false,
          "S4": true,
          "S5": false,
          "S6": true,
          "S7": false,
          "S8": true,
        }
      } 
    });

    return await Firestore.instance.collection("devices").document(serial).get();

  }

}