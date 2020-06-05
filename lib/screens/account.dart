import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _showPassword = true;

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Conta"),
      ),

      body: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nome Completo', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      initialValue: "Marcus Roberto",
                      style: TextStyle(fontSize:15),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      initialValue: "marcus.rcm@outlook.com",
                      style: TextStyle(fontSize:15, color: Colors.grey),
                      enabled: false,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'CPF/CNPJ', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      initialValue: "429.759.388-29",
                      style: TextStyle(fontSize:15, color: Colors.grey),
                      enabled: false,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Celular', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      initialValue: "(35) 99868-1301",
                      style: TextStyle(fontSize:15),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Senha', suffixIcon: GestureDetector(child: Icon(Icons.remove_red_eye), onTap: () => setState(() { _showPassword = !_showPassword; })), labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      initialValue: "vwsolucoes123",
                      style: TextStyle(fontSize:15),
                      obscureText: _showPassword,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.indigo,
                        textColor: Colors.white,
                        child: Text("SALVAR"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ), 
    );
  }
}