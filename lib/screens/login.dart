import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vwwifi/components/LoginCart.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();

  bool _isLoading = false;
  String _email, _password;

  Widget circularProgress() {
    return (_isLoading) ? Center(child: CircularProgressIndicator()) : Container(height: 0, width: 0);
  }

  Widget logoHeader() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.only(top: 70),
        child: Image.asset("assets/images/logoVW.png", height: 120),
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(Icons.mail, color: Colors.grey)
        ),
        validator: (value) => value.isEmpty ? 'O campo de email não pode ser vazio' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget passwordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        decoration: new InputDecoration(
          hintText: 'Senha',
          icon: new Icon(Icons.lock, color: Colors.grey)
        ),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'O campo de senha não pode ser vazio' : null,
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget loginButton() {
    return ButtonTheme(
      minWidth: (MediaQuery.of(context).size.width - 35),
      child: RaisedButton(
        child: Text("LOGIN"),
        color: Colors.blue[900],
        textColor: Colors.white,
        onPressed: validateAndSubmit,
      ),
    );
  }

  Widget errorMessage() {
    return (_errorMessage.length > 0 && _errorMessage != null) ? Text(_errorMessage) : Container(height: 0);
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          logoHeader(),
          emailInput(),
          passwordInput(),
          loginButton(),
          errorMessage(),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          


          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text("Esqueci minha senha", textAlign: TextAlign.center),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Theme.of(context).textTheme.button.color),
              children: [
                TextSpan(text: 'Não possui um conta?  '),
                TextSpan(text: 'Registre-se', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[700])),
              ]
            ),
          ),
        ],
      ),
    );
  }
}