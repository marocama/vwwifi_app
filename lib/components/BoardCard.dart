import 'package:flutter/material.dart';

enum Choice { editar, apagar }

class BoardCard extends StatelessWidget {
  
  final String uid;
  final bool active;
  final String name;
  final bool isList;
  final VoidCallback show;
  final VoidCallback edit;
  final VoidCallback delt;

  BoardCard({
    @required this.uid,
    this.active = false,
    this.name = "",
    this.isList = false,
    this.show,
    this.edit,
    this.delt,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(stops: [0.015, 0.015], colors: [(active) ? Colors.green : Colors.red, Theme.of(context).cardColor]),
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
              child: Text(uid.toUpperCase(), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
            ),
            Expanded(child: Text(name.toUpperCase(), style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w800))),
            (isList) ?
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                PopupMenuItem<Choice>(value: Choice.editar, child: Text('Renomear')),
                PopupMenuItem<Choice>(value: Choice.apagar, child: Text('Apagar')),
              ],
              onSelected: (Choice result) {
                switch (result) {
                  case Choice.editar:
                    edit();
                    break;
                  case Choice.apagar:
                    delt();
                    break;
                }
              },
              tooltip: 'Opções',
              icon: Icon(Icons.more_vert, color: Colors.grey),
            ) :
            FlatButton(
              child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onPressed: () { show(); },
            )
          ],
        ),
      ),
    );
  }
}
