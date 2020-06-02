import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class InsertTransmitter extends StatefulWidget {
  InsertTransmitter({Key key}) : super(key: key);

  @override
  _InsertTransmitterState createState() => _InsertTransmitterState();
}

class _InsertTransmitterState extends State<InsertTransmitter> {
  int _count = 0;
  bool _transmitter = true;

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Novo Transmissor'),
        actions: <Widget>[
          Icon(Icons.help, size: 28, semanticLabel: 'Ajuda'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(Icons.account_circle, size: 28, semanticLabel: 'Usuário'),
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[

            TextFormField(
              decoration: InputDecoration(
                hintText: '1234AB',
                labelText: 'Número Serial',
                icon: Icon(Icons.memory),
              )
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Minha casa',
                labelText: 'Identificador casa',
                icon: Icon(Icons.local_offer),
              )
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Icon(_transmitter ? Icons.wb_cloudy : Icons.cloud_off, color: Colors.grey),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(_transmitter ? 'Remoto' : 'Local', style: TextStyle(color: CustomColors.TextHeaderGrey)),
                ),
                Spacer(),
                Switch(
                  value: true,
                  onChanged: (value) {
                    setState(() => _transmitter = !_transmitter);
                  },
                ),
              ],
            ),
            Visibility(
              visible: !_transmitter,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '192.168.0.0',
                  labelText: 'Endereço IP',
                  icon: Icon(Icons.desktop_mac),
                )
              ),
            ),
            
            
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text(
                  'Cadastrar',
                  style: new TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () => null,
                color: Colors.indigo,
              ),
              margin: new EdgeInsets.only(
                top: 20.0
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ), 
    );
  }
}