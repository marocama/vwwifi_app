import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class InsertTransmitter extends StatefulWidget {
  InsertTransmitter({Key key}) : super(key: key);

  @override
  _InsertTransmitterState createState() => _InsertTransmitterState();
}

class _InsertTransmitterState extends State<InsertTransmitter> {
  int _count = 0;

  TextEditingController _controllerSerial;

  void initState() {
    super.initState();
    _controllerSerial = TextEditingController();
  }

  void dispose() {
    _controllerSerial.dispose();
    super.dispose();
  }

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

            Row(
                children: <Widget>[
                  Icon(Icons.memory),
                  TextField(
                    controller: _controllerSerial,
                    onTap: () {},
                  ),
                ],
              ),
Row(
                children: <Widget>[
                  Icon(Icons.memory),
                  TextField(
                    controller: _controllerSerial,
                    onTap: () {},
                  ),
                ],
              ),
                       
            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Enviar',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.memory),
      ),
    );
  }
}