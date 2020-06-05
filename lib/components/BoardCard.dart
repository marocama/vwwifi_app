import 'package:flutter/material.dart';

enum Choice { visualizar, editar, apagar }

class BoardCard extends StatelessWidget {
  const BoardCard({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

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

    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(stops: [0.015, 0.015], colors: [Colors.green, Theme.of(context).cardColor]),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: (Theme.of(context).brightness == Brightness.light) ? Colors.grey : Colors.transparent,
            blurRadius: 10.0,
            spreadRadius: 5.0,
          ),
        ],          
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
            Expanded(child: Text('FÁBRICA CAMPINAS UNIDADE II', style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w800))),
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                PopupMenuItem<Choice>(value: Choice.visualizar, child: Text('Visualizar')),
                PopupMenuItem<Choice>(value: Choice.editar, child: Text('Renomear')),
                PopupMenuItem<Choice>(value: Choice.apagar, child: Text('Apagar')),
              ],
              onSelected: (Choice result) {
                switch (result) {
                  case Choice.visualizar:
                    Navigator.pushNamed(context, "/transmitter");
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
              icon: Icon(Icons.more_vert, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
