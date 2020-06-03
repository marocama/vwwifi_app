import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            //Image(image: AssetImage("assets/images/logoVW.png")),

            Card(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icon(Icons.mail)),
                      style: TextStyle(fontSize:15),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Senha', labelStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icon(Icons.lock)),
                      style: TextStyle(fontSize:15),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: RaisedButton(
                child: Text("LOGIN"),
                color: Colors.blue[900],
                textColor: Colors.white,
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text("Esqueci minha senha", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Não possui uma conta? ", style: TextStyle(color: Colors.white)),
                Text("Registre-se", style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.w800)),
              ],
            ),
            

            
          ],
        ),
      ),
    );
  }
}