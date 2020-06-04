import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Image.asset("assets/images/logoVW.png", height: 120),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 35, 15, 5),
            child: Card(
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
          ),

          ButtonTheme(
            minWidth: (MediaQuery.of(context).size.width - 35),
            child: RaisedButton(
              child: Text("LOGIN"),
              color: Colors.blue[900],
              textColor: Colors.white,
              onPressed: () { Navigator.pushNamed(context, "/register"); },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),


          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text("Esqueci minha senha", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
          ),

          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(text: 'Não possui um conta? '),
                TextSpan(text: 'Registre-se', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[700])),
              ]
            ),
          ),

        ],
      ),
    );
  }
}