import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vwwifi/components/BoardCard.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum Choice { visualizar, editar, apagar }

class _HomeState extends State<Home> {

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/home");
  }

  Widget build(BuildContext context) {

    Future<void> _delete() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Tem certeza que deseja apagar?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("\nA placa ficará disponível para inclusão novamente em instantes."),
                  
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () { Navigator.of(context).pop(); }, 
                child: Text("CANCELAR"),
              ),
              FlatButton(
                onPressed: () { Navigator.of(context).pop(); }, 
                child: Text("APAGAR"),
              ),
            ],
          );
        },
      );
    }

    Future<void> _rename() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Identificador', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextStyle(fontSize:15),
                    initialValue: 'FÁBRICA CAMPINAS UNIDADE II',
                  ),      
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () { Navigator.of(context).pop(); }, 
                child: Text("CANCELAR"),
              ),
              FlatButton(
                onPressed: () { Navigator.of(context).pop(); }, 
                child: Text("SALVAR"),
              ),
            ],
          );
        },
      );
    }

    
    return Scaffold(
      
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Image.asset('assets/images/logoVW.png'),
        ),
        title: Text('VW Soluções'),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.help, size: 28, semanticLabel: 'Ajuda'),
            onTap: () { Navigator.pushNamed(context, "/login"); },
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              child: Icon(Icons.account_circle, size: 28, semanticLabel: 'Usuário'),
              onTap: () { Navigator.pushNamed(context, "/profile"); },
            ),
          ),
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
              child: Text('Dispositivos:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            
            
            BoardCard(),
            BoardCard(),

            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _deslogarUsuario();
         },
        tooltip: 'Registrar transmissor',
        backgroundColor: Colors.orange[500],
        
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}