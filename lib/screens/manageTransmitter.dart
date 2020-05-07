import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Transmitter extends StatefulWidget {
  Transmitter({Key key}) : super(key: key);

  @override
  _TransmitterState createState() => _TransmitterState();
}

enum Choice { visualizar, editar, apagar }

class _TransmitterState extends State<Transmitter> {
  int _count = 0;

  Widget build(BuildContext context) {
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

            Card(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.info, size: 15, color: CustomColors.TextHeaderGrey),
                        Text(' 2451AB', style: TextStyle(fontSize: 15, color: CustomColors.TextHeaderGrey, fontWeight: FontWeight.w800)),
                        Text(' - '),
                        Text('Piscina Fazenda', style: TextStyle(fontSize: 15, color: CustomColors.TextHeader, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.autorenew, size: 15, color: Colors.grey,),
                        Text(' Últ. Pacote: 07/05/20 15:57'),
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
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.green, size: 35),
                    title: Text('Bomba de Água'),
                    subtitle: Text('Saída 1'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.green, size: 35),
                    title: Text('Toldo'),
                    subtitle: Text('Saída 2'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.grey, size: 35),
                    title: Text('Aspirador'),
                    subtitle: Text('Saída 3'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.green, size: 35),
                    title: Text('Ar Condicionado'),
                    subtitle: Text('Saída 4'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Enviar',
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.send),
      ),
    );
  }
}