import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vwwifi/components/BoardCard.dart';
import 'package:vwwifi/components/ExtensionCard.dart';
import 'package:vwwifi/util/Firebase.dart';

class ViewBoard extends StatefulWidget {
  final Map values;

  ViewBoard(this.values);

  @override
  _ViewBoardState createState() => _ViewBoardState();
}

enum Choice { editar, apagar }

class _ViewBoardState extends State<ViewBoard> {

  final _renaKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _controllerName = TextEditingController(text: "");

  Map protocol;
  bool _loading = false;
  DocumentSnapshot device;

  _renameProcess() async {

  }

  _renameDialog() async {
    _controllerName = TextEditingController(text: widget.values["name"]);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          insetPadding: EdgeInsets.symmetric(horizontal: 15.0),
          title: Text("Renomear dispositivo"),
          content: Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _renaKey,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Identificador'),
                    validator: (value) => (value.length < 3) ? 'Identificador muito curto' : null,
                    controller: _controllerName,
                  ),
                ),
              );
            },
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () { Navigator.of(context).pop(); }, 
              child: Text("CANCELAR"),
            ),
            FlatButton(
              onPressed: () { if(_renaKey.currentState.validate()) {  }}, 
              child: Text("RENOMEAR"),
            ),
          ],
        );
      },
    );
  }

  _deleteDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          insetPadding: EdgeInsets.symmetric(horizontal: 15.0),
          title: Text("Tem certeza que deseja apagar?"),
          content: Builder(
            builder: (context) {
              return Text("Clique em confirme para apagar");
            },
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () { Navigator.of(context).pop(); }, 
              child: Text("CANCELAR"),
            ),
            FlatButton(
              onPressed: () { }, 
              child: Text("CONFIRMAR"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() { _loading = true; });
    Firebase.getCurrentUser().then((logged) { 
      if(logged == null) { 
        Navigator.pushReplacementNamed(context, '/login'); 
      } else { 
        Firebase.getDataDevice(widget.values["nSerial"]).then((value) { 
          setState(() { device = value; protocol = Map.from(device.data["protocol"]["ENTRADAS"]); print("protocolo:");print(protocol); _loading = false; });
        });
      }
    });
  }

  Widget build(BuildContext context) {
    print(device.data["protocol"]["SAIDAS"]["S2"]);
    print(protocol);
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Opacity(
            opacity: _loading ? 0.2 : 1.0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  BoardCard(
                    uid: widget.values["nSerial"], 
                    name: widget.values["name"],
                    active: widget.values["active"],
                    isList: true,
                    edit: () { _renameDialog(); },
                    delt: () { _deleteDialog(); }
                  ),
                  /*
                  ListView.builder(
                    itemCount: device.data["protocol"].lenght,  
                  ),
                  */
                  ExtensionCard(),
                  ExtensionCard(),

                  /*Card(
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
                  ),*/
                  
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: _loading ? 1.0 : 0.0,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Enviar',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.send, color: Colors.white),
      ),
    );
  }
}