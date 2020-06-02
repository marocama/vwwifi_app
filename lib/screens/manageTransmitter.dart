import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Transmitter extends StatefulWidget {
  Transmitter({Key key}) : super(key: key);

  @override
  _TransmitterState createState() => _TransmitterState();
}

class _TransmitterState extends State<Transmitter> {
  bool _s1 = false, _s2 = false;

  Future _sendCommand() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "{\n\t\t\"porta\": \"valor\"\n}",
              labelText: 'Enviar Comando',
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.indigo)
              ),
            ),
            minLines: 3,
            maxLines: 5,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Enviar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
          Icon(Icons.help, size: 32, semanticLabel: 'Ajuda'),
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

            Card(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.memory, size: 15, color: CustomColors.TextHeaderGrey),
                        Text(' 2451AB', style: TextStyle(fontSize: 15, color: CustomColors.TextHeaderGrey, fontWeight: FontWeight.w800)),
                        Text(' - '),
                        Text('Piscina Fazenda', style: TextStyle(fontSize: 15, color: CustomColors.TextHeader, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.autorenew, size: 15, color: Colors.grey,),
                        Text(' Últ. Pacote: 08/05/20 15:57'),
                      ],
                    ), 
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.chevron_right, color: CustomColors.TextHeaderGrey),
                        Text('SAÍDAS', style: TextStyle(fontWeight: FontWeight.w800, color: CustomColors.TextHeaderGrey)),
                        Spacer(),
                        Icon(Icons.edit, color: CustomColors.TextSubHeaderGrey, size: 18),
                      ],
                    ), 
                  ),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: _s1 ? Colors.green : Colors.grey, size: 35),
                    title: Text('Toldo', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('Saída 1'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    dense: true,
                    onTap: () => setState(() => _s1 = !_s1),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: _s2 ? Colors.green : Colors.grey, size: 35),
                    title: Text('Aspirador', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('Saída 2'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    dense: true,
                    onTap: () => setState(() => _s2 = !_s2),
                  ),
                  
                ],
              ),
            ),
            
            Card(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.chevron_right, color: CustomColors.TextHeaderGrey,),
                        Text('ENTRADAS', style: TextStyle(fontWeight: FontWeight.w800, color: CustomColors.TextHeaderGrey)),
                        Spacer(),
                        Icon(Icons.edit, color: CustomColors.TextSubHeaderGrey, size: 18),
                      ],
                    ), 
                  ),
                  ListTile(
                    leading: Icon(Icons.remove_circle, color: Colors.green, size: 35),
                    title: Text('Sensor de Luminosidade'),
                    subtitle: Text('Entrada 1'),
                    dense: true,
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.remove_circle_outline, color: Colors.grey, size: 35),
                    title: Text('Sensor de Chuva'),
                    subtitle: Text('Entrada 2'),
                    dense: true,
                  ),
                ],
              ),
            ),


            Card(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.chevron_right, color: CustomColors.TextHeaderGrey,),
                        Text('OUTROS', style: TextStyle(fontWeight: FontWeight.w800, color: CustomColors.TextHeaderGrey)),
                        Spacer(),
                        Icon(Icons.edit, color: CustomColors.TextSubHeaderGrey, size: 18),
                      ],
                    ), 
                  ),
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

            ExpansionTile(
              title: Text("EXPANSAO"),
            ),
            
            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pushNamed(context, "/send"); },
        tooltip: 'Enviar',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.send),
      ),
    );
  }
}