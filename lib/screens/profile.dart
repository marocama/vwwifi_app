import 'package:flutter/material.dart';
import 'package:vwwifi/models/User.dart';
import 'package:vwwifi/util/Firebase.dart';

class Profile extends StatefulWidget {
  final User user;

  Profile(this.user);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-241, left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Código da conta:"),
                    subtitle: Text(widget.user.uid, style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.code),
                  ),
                  ListTile(
                    title: Text("Convidados:"),
                    subtitle: Text("2 em uso"),
                    trailing: Icon(Icons.supervised_user_circle),
                  ),
                  ListTile(
                    title: Text("Vencimento:"),
                    subtitle: Text(widget.user.expire.day.toString() + "/" + widget.user.expire.month.toString() + "/" + widget.user.expire.year.toString(), style: TextStyle(color: Colors.grey)),
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 18),
            child: Row(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: (widget.user.photoUrl.isNotEmpty) ? NetworkImage(widget.user.photoUrl) : null,
                      backgroundColor: (widget.user.photoUrl.isNotEmpty) ? Colors.transparent : Colors.grey,
                      radius: 40,
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
                      child: Text(widget.user.name.split(" ").first + " " + widget.user.name.split(" ").last, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child: Text(widget.user.accountType, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Divider(height: 0),

          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.developer_board),
            title: Text("Equipamentos"),
            subtitle: Text("Convidados, vencimentos"),
            onTap: () => _equipamentDialog(),
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("Ajuda"),
            subtitle: Text("Fale conosco, termos"),
            onTap: () => _helpDialog(),
          ),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text("Alterar senha"),
            onTap: () => Navigator.pushNamed(context, "/account"),
          ),
          ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text("Excluir conta"),
            onTap: () => _helpDialog(),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            onTap: () => _logoutDialog(),
          ),
            
            
          SizedBox(height: 80),
        ],
      ), 
    );
  }
}