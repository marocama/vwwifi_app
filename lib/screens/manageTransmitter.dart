import 'package:flutter/material.dart';
import 'package:vwwifi/components/BoardCard.dart';
import 'package:vwwifi/components/ExtensionCard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Transmitter extends StatefulWidget {
  Transmitter({Key key}) : super(key: key);

  @override
  _TransmitterState createState() => _TransmitterState();
}

enum Choice { visualizar, editar, apagar }

class _TransmitterState extends State<Transmitter> {
  bool _s1 = false, _s2 = false;

  Widget build(BuildContext context) {

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
                      height: (MediaQuery.of(context).size.height/2),
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

    _deslogarUsuario() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      //Navigator.of(context).pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
      //Navigator.pushReplacementNamed(context, "/login");
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
                    decoration: InputDecoration(labelText: 'Saída 1', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextStyle(fontSize:15),
                    initialValue: 'Toldo',
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Saída 2', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextStyle(fontSize:15),
                    initialValue: 'Aspirador',
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Entrada 1', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextStyle(fontSize:15),
                    initialValue: 'Sensor de Luminosidade',
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
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.edit, size: 28, semanticLabel: 'Renomear'),
            onTap: () { Navigator.pushNamed(context, "/rename"); },
          ),
          
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn-ofuxico.akamaized.net/img/upload/noticias/2019/06/19/bruna_marquezine_reproducao_instagram_351888_36.jpg"),
              radius: 18,
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
            
            BoardCard(),
            
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
        onPressed: () => _deslogarUsuario(),
        tooltip: 'Enviar',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.send, color: Colors.white),
      ),
    );
  }
}