import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nome completo', labelStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icon(Icons.mail)),
                        style: TextStyle(fontSize:15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icon(Icons.mail)),
                        style: TextStyle(fontSize:15),
                        keyboardType: TextInputType.emailAddress,
                        validator: (error) => 'Insira um email válido',
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Senha', labelStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icon(Icons.lock)),
                        style: TextStyle(fontSize:15),
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Celular', labelStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icon(Icons.phone_android)),
                        style: TextStyle(fontSize:15),
                        keyboardType: TextInputType.phone,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(text: 'Ao criar sua conta, você aceita os '),
                              TextSpan(text: 'Termos de uso', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: '.'),
                            ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

            ButtonTheme(
              minWidth: (MediaQuery.of(context).size.width - 35),
              child: RaisedButton(
                child: Text("REGISTRAR"),
                color: Colors.blue[900],
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),

            
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Theme.of(context).textTheme.button.color),
                  children: [
                    TextSpan(text: 'Já possui conta? '),
                    TextSpan(text: 'Faça Login', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[700])),
                  ]
                ),
              ),
            ),

          ],
        ),
        ),
      ),
    );
  }
}