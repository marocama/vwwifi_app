import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Rename extends StatefulWidget {
  Rename({Key key}) : super(key: key);

  @override
  _RenameState createState() => _RenameState();
}

class _RenameState extends State<Rename> {

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Renomear campos"),
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () { Navigator.pop(context); },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
            child: Icon(Icons.save),
          ),
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            
            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ExpansionTile(
                title: Text('SAÍDAS', style: TextStyle(fontWeight: FontWeight.w800)),
                initiallyExpanded: true,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Saída 1', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextStyle(fontSize:15),
                      initialValue: 'Toldo',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Saída 2', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextStyle(fontSize:15),
                      initialValue: 'Aspirador',
                    ),
                  ),
                ],
              ),
            ),
            
            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ExpansionTile(
                title: Text('ENTRADAS', style: TextStyle(fontWeight: FontWeight.w800)),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Entrada 1', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextStyle(fontSize:15),
                      initialValue: 'Sensor de Luminosidade',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Entrada 2', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextStyle(fontSize:15),
                      initialValue: 'Sensor de Chuva',
                    ),
                  ),
                ],
              ),
            ),

            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ExpansionTile(
                title: Text('ANALÓGICAS', style: TextStyle(fontWeight: FontWeight.w800)),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Analógica 1', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextStyle(fontSize:15),
                      initialValue: 'Potênciometro Portão',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Analógica 2', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextStyle(fontSize:15),
                      initialValue: 'Nível Caixa Principal',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), 
    );
  }
}