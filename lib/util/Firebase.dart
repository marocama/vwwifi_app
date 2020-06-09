import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vwwifi/models/User.dart';

class Firebase {

  static Future<FirebaseUser> getCurrentUser() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    return await auth.currentUser();
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