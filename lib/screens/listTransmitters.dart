import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum Choice { visualizar, editar, apagar }

class _HomeState extends State<Home> {

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
          Icon(Icons.help, size: 28, semanticLabel: 'Ajuda'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(Icons.account_circle, size: 28, semanticLabel: 'Usuário'),
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
            
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.green, Theme.of(context).cardColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: (Theme.of(context).brightness == Brightness.light) ? Colors.grey : Colors.transparent,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('5429WS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                    ),
                    Expanded(
                      child: Text('PISCINA FAZENDA', style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w800)),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                        const PopupMenuItem<Choice>(
                          value: Choice.visualizar,
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.editar,
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.apagar,
                          child: Text('Apagar'),
                        ),
                      ],
                      onSelected: (Choice result) {
                        switch (result) {
                          case Choice.visualizar:
                            Navigator.pushNamed(context, "/transmitter");
                            break;
                          case Choice.editar:
                            Navigator.pushNamed(context, "/profile");
                            break;
                          case Choice.apagar:
                            Navigator.pushNamed(context, "/login");
                            break;
                        }
                      },
                      tooltip: 'Opções',
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.green, Theme.of(context).cardColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: (Theme.of(context).brightness == Brightness.light) ? Colors.grey : Colors.transparent,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('7260KP', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                    ),
                    Expanded(
                      child: Text('FÁBRICA CAMPINAS UNIDADE II', style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w800),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                        const PopupMenuItem<Choice>(
                          value: Choice.visualizar,
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.editar,
                          child: Text('Renomear'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.apagar,
                          child: Text('Apagar'),
                        ),
                      ],
                      onSelected: (Choice result) {
                        switch (result) {
                          case Choice.visualizar:
                            _delete();
                            break;
                          case Choice.editar:
                            _rename();
                            break;
                          case Choice.apagar:
                            _delete();
                            break;
                        }
                      },
                      tooltip: 'Opções',
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.red, Theme.of(context).cardColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: (Theme.of(context).brightness == Brightness.light) ? Colors.grey : Colors.transparent,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('2451AB', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                    ),
                    Expanded(
                      child: Text('FÁBRICA CAMPINAS UNIDADE I', style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w800)),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                        const PopupMenuItem<Choice>(
                          value: Choice.visualizar,
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.editar,
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.apagar,
                          child: Text('Apagar'),
                        ),
                      ],
                      tooltip: 'Opções',
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pushNamed(context, "/new"); },
        tooltip: 'Registrar transmissor',
        backgroundColor: Colors.orange[500],
        
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}