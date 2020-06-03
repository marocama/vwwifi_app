import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _showPassword = false;

  Widget build(BuildContext context) {

    Future<void> _equipament() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title:  Text('Equipamentos', style: TextStyle(fontSize: 16)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[

                  ListTile(
                    title: Text("Convidados:"),
                    subtitle: RichText(
                      text: TextSpan(
                        style: TextStyle(color: CustomColors.TextHeaderGrey),
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
                    subtitle: Text("30/06/2020", style: TextStyle(color: CustomColors.TextHeaderGrey)),
                    trailing: Icon(Icons.payment),
                  ),
                  
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () { Navigator.of(context).pop(); }, 
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }

    Future<void> _help() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title:  Text('Ajuda', style: TextStyle(fontSize: 16)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Consulte nosso site."),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () { Navigator.of(context).pop(); },
                child: Text("IR"),
              ),
            ],
          );
        },
      );
    }

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
                      backgroundColor: Colors.indigo,
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
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Administrador", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: CustomColors.TextHeaderGrey)),
                    ),
                  ],
                ),
              ],
            ),
            
            SizedBox(height: 10),

            Divider(thickness: 1),

            ListTile(
              leading: Icon(Icons.vpn_key, color: Colors.blue[500]),
              title: Text("Conta"),
              subtitle: Text("Informações de contato, senha"),
              onTap: () { Navigator.pushNamed(context, "/account"); },
            ),
            ListTile(
              leading: Icon(Icons.developer_board, color: Colors.blue[500]),
              title: Text("Equipamentos"),
              subtitle: Text("Utilização, convidados, vencimentos"),
              onTap: _equipament,
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.blue[500]),
              title: Text("Ajuda"),
              subtitle: Text("Guia, fale conosco, termos"),
              onTap: _help,
            ),
            
            
            SizedBox(height: 80),
          ],
        ),
      ), 
    );
  }
}