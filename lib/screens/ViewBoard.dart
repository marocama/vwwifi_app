import 'package:flutter/material.dart';
import 'package:vwwifi/components/BoardCard.dart';
import 'package:vwwifi/components/ExtensionCard.dart';

class ViewBoard extends StatefulWidget {
  final Map values;

  ViewBoard(this.values);

  @override
  _ViewBoardState createState() => _ViewBoardState();
}

enum Choice { visualizar, editar, apagar }

class _ViewBoardState extends State<ViewBoard> {

  Future<void> _rename(String name) async {
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
                    initialValue: name,
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
                Text("\nA placa estará disponível para inclusão novamente em instantes."),
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

  createNewMessage() {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return WillPopScope(
                  onWillPop: () {
                    return Future.value(true);
                  },
                  child: Material(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: (MediaQuery.of(context).size.width/2),
                      height: (MediaQuery.of(context).size.height-250),
                      child: Column(
                        children: <Widget>[
                          new Text('?'),
                          Container(
                            height: 20,
                          ),
                          Container(
                            height: 10,
                          ),
                          TextField(decoration: InputDecoration(labelText: "Data")),
                          Container(
                            height: 10,
                          ),
                          TextField(decoration: InputDecoration(labelText: "Hora")),
                          Container(
                            height: 10,
                          ),
                          TextField(
                              decoration: InputDecoration(labelText: 'Mensagem')),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Spacer(),
                              FlatButton(
                                  child: Text('sendMessage'),
                                  onPressed: () {}),
                              FlatButton(
                                  child: Text('closealert'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          );
        },
      );
    }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[         
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
            child: GestureDetector(
              child: Icon(Icons.edit, size: 28, semanticLabel: 'Renomear'),
              onTap: () {},
            ),
          ),
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 15),
            BoardCard(
              uid: widget.values["board"].documentID, 
              name: widget.values["board"].data["name"], 
              active: widget.values["board"].data["active"],
              isList: true,
              edit: () { _rename(widget.values["board"].data["name"]); },
              delt: () { _delete(); }
            ),
            
            ExtensionCard(),
            
            ExtensionCard(),

            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ExpansionTile(
                title: Text('ANALÓGICAS', style: TextStyle(fontWeight: FontWeight.w800)),
                children: <Widget>[
                  ListTile(
                    leading: FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '1024',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                            children: <TextSpan>[
                              TextSpan(text: ' cm', style: TextStyle(color: Colors.blue, fontSize: 12),)
                            ]
                          ),
                        ),
                      ),
                    ),
                    title: Text('Potênciometro Portão'),
                    subtitle: Text('Analógica 2'),
                    dense: true,
                  ),
                  ListTile(
                    leading: FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '57',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                            children: <TextSpan>[
                              TextSpan(text: ' %', style: TextStyle(color: Colors.blue, fontSize: 12),)
                            ]
                          ),
                        ),
                      ),
                    ),
                    title: Text('Nível Caixa Principal'),
                    subtitle: Text('Analógica 1'),
                    dense: true,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () { createNewMessage(); },
        tooltip: 'Enviar',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.send, color: Colors.white),
      ),
    );
  }
}