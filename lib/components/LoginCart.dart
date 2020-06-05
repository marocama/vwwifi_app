import 'package:flutter/material.dart';

class LoginCart extends StatelessWidget {
  const LoginCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 35, 15, 5),
      child: Card(
        child: Padding(
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
    );
  }
}

