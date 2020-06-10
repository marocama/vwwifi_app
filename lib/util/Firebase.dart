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

  static Future<String> registerUser(String email, String password) async {

    AuthResult result;

    try {
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password);

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

  static Future<FirebaseUser> getCurrentUser() async {

    return await FirebaseAuth.instance.currentUser();
  }

  static Future<User> getDataLoggedUser() async {

    FirebaseUser firebaseUser = await getCurrentUser();
    String uid = firebaseUser.uid;

    Firestore db = Firestore.instance;

    DocumentSnapshot snapshot = await db.collection("users").document(uid).get();

    //User user = User.fromMap(snapshot.data);
    
    //return user;

    Map<String, dynamic> dados = snapshot.data;
    String name  = dados['name'];
    String email = dados["email"];

    User usuario = User();
    usuario.name = name;
    usuario.email= email;

    return usuario;

  }
}