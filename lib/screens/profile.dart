import 'package:flutter/material.dart';
import 'package:vwwifi/constants/Themes.dart';
import 'package:vwwifi/util/Firebase.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  bool _showPassword = false;

  _equipamentDialog() async {
    showGeneralDialog(
      barrierLabel: "Equipamentos",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Card(
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-169, left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Convidados:"),
                    subtitle: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan> [
                          TextSpan(text: '2', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' em uso | '),
                          TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' livre'),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.supervised_user_circle),
                  ),
                  ListTile(
                    title: Text("Vencimento:"),
                    subtitle: Text("30/06/2020", style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.payment),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0.4)).animate(anim),
          child: child,
        );
      },
    );
  }

  _helpDialog() async {
    showGeneralDialog(
      barrierLabel: "Ajuda",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Card(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-77, left: 15, right: 15),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Consulte nosso site para mais informações e meios de contato."),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.4)).animate(anim),
          child: child,
        );
      },
    );
  }

  _logoutDialog() async {
    print("email verificado:");
    print(Firebase.getCurrentUser().then((value) => print(value.isEmailVerified.toString())));
    print("nome:");
    print(Firebase.getCurrentUser().then((value) => print(value.displayName.toString())));
    print("email:");
    print(Firebase.getCurrentUser().then((value) => print(value.email.toString())));
    print("telefone:");
    print(Firebase.getCurrentUser().then((value) => print(value.phoneNumber.toString())));
    print("photo:");
    print(Firebase.getCurrentUser().then((value) => print(value.photoUrl.toString())));
    print("uid:");
    print(Firebase.getCurrentUser().then((value) => print(value.uid.toString())));
    showGeneralDialog(
      barrierLabel: "Sair",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Card(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-109, left: 15, right: 15),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Tem certeza que deseja sair?"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("SAIR"),
                      onPressed: () => Firebase.logoutUser().then((value) => Navigator.pushReplacementNamed(context, '/login')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.4)).animate(anim),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: ExactAssetImage('assets/images/perfil.jpg'),
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                    CircleAvatar(
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                      backgroundColor: Colors.blue[700],
                      radius: 15,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Vinagrete da Silva", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child: Text("Administrador", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey)),
                    ),
                  ],
                ),
              ],
            ),
            
            SizedBox(height: 25),

            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Conta"),
              subtitle: Text("Informações de contato, senha"),
              onTap: () { Firebase.getDataLoggedUser(); },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.developer_board),
              title: Text("Equipamentos"),
              subtitle: Text("Utilização, convidados, vencimentos"),
              onTap: () => _equipamentDialog(),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Ajuda"),
              subtitle: Text("Guia, fale conosco, termos"),
              onTap: () => _helpDialog(),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              //subtitle: Text("Guia, fale conosco, termos"),
              onTap: () => _logoutDialog(),
            ),
            
            
            SizedBox(height: 80),
          ],
        ),
      ), 
    );
  }
}