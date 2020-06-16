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

  static Future<void> recoveryPassword(String email) async {

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
  }

  static Future<FirebaseUser> getCurrentUser() async {

    return await FirebaseAuth.instance.currentUser();
  }

  static Future<User> getDataLoggedUser() async {

    FirebaseUser firebaseUser = await getCurrentUser();

    DocumentSnapshot snapshot = await Firestore.instance.collection("users").document(firebaseUser.uid).get();
    QuerySnapshot snapshotBrd = await Firestore.instance.collection("users").document(firebaseUser.uid).collection("devices").orderBy("name").getDocuments();
    /*
    print(snapshot.data);
    print(snapshotBrd.documents.toString());
    print(snapshotBrd.documents.first.data.toString());
    print(snapshotBrd.documents.first.documentID);
    print(snapshotBrd.documents.length);
    */
    User user = User(
      uid: firebaseUser.uid,
      name: snapshot.data["name"],
      email: firebaseUser.email,
      phone: snapshot.data["phone"],
      expire: snapshot.data["expire"].toDate(),
      photoUrl: snapshot.data["photoUrl"],
      accountType: snapshot.data["accountType"],
      boards: snapshotBrd.documents.toList(),
    );
    
    return user;
  }
}