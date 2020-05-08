import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class SendCommand extends StatefulWidget {
  SendCommand({Key key}) : super(key: key);

  @override
  _SendCommandState createState() => _SendCommandState();
}

class _SendCommandState extends State<SendCommand> {
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
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[

            TextFormField(
              decoration: InputDecoration(
                hintText: "{\n\t\t\"porta\": \"valor\"\n}",
                labelText: 'Enviar Comando',
                fillColor: CustomColors.TextGrey,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.indigo)
                ),
              ),
              minLines: 5,
              maxLines: 10,
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