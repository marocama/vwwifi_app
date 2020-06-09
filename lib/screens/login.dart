import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:vwwifi/constants/themes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final _formKey = GlobalKey<FormState>();

  TextEditingController _controllerEmail = TextEditingController(text: "marc");
  TextEditingController _controllerPassw = TextEditingController(text: "1234");

  bool _loading = false;

  Future<void> login() async {

    setState(() { _loading = true; });

    FirebaseAuth auth = FirebaseAuth.instance;
    AuthResult result;
    try {
       result = await auth.signInWithEmailAndPassword(
          email: _controllerEmail.text.trim(),
          password: _controllerPassw.text);
    } on PlatformException catch (e) {
      print(e);
      print("erro");
    }

    if(result != null) {
            _loading=false;
            print("logado");
            Navigator.pushReplacementNamed(context, "/transmitter");
    }

    //FirebaseAuth auth = FirebaseAuth.instance;

    //FirebaseAuth.instance.signInWithEmailAndPassword(email: _controllerEmail.text.trim(), password: _controllerPassw.text).then((onValue) {

    //  _loading = false;
    //  print("logado");
    //  Navigator.pushReplacementNamed(context, "/transmitter");

    //}).catchError((PlatformException onError) { print(onError); print("errooo");});

    //auth.signInWithEmailAndPassword(email: _controllerEmail.text.trim(), password: _controllerPassw.text).then((currentUser) => Navigator.pushReplacementNamed(context, "/transmitter")).catchError((error) => print(error));
    //AuthResult result = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _controllerEmail.text.trim(), password: _controllerPassw.text)) as AuthResult;
    //if(result != null) {
    //  Navigator.pushReplacementNamed(context, "/transmitter");
    //} else {
    //  print(result);
    //}


  }

  _verifyUser() async {

    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser user = await auth.currentUser();

    if(user != null) Navigator.pushReplacementNamed(context, "/transmitter");
  }

  @override
  void initState() {
    super.initState();
    _verifyUser();
  }

  Widget circularProgress() {
    return (_loading) ? Center(child: CircularProgressIndicator()) : Container(height: 0, width: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Hero(tag: "logo", child: Image.asset("assets/images/logoVW.png", height: 120)),
                Card(
                  margin: EdgeInsets.fromLTRB(15, 50, 15, 5),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: 'Email', icon: Icon(Icons.mail, color: Colors.grey)),
                          validator: (value) => (value.isEmpty || value.length < 5 || !value.contains('@')) ? 'Endereço de email inválido' : null,
                          //onSaved: (value) => _email = value.trim(),
                          controller: _controllerEmail,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Senha', icon: new Icon(Icons.lock, color: Colors.grey)),
                          obscureText: true,
                          validator: (value) => (value.isEmpty || value.length < 6) ? 'Sua senha deve conter mais de 6 caracteres' : null,
                          //onSaved: (value) => _password = value,
                          controller: _controllerPassw,
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: (MediaQuery.of(context).size.width - 30),
                  child: RaisedButton(
                    child: Text("LOGIN"),
                    color: AppThemes.primary,
                    onPressed: () { if(_formKey.currentState.validate()) { login(); } },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("Esqueci minha senha", textAlign: TextAlign.center),
                ),
                /*GestureDetector(
                  onTap: () { Navigator.pushNamed(context, "/register"); },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Não possui um conta?  ', style: TextStyle(color: Theme.of(context).textTheme.button.color)),
                        TextSpan(text: 'Registre-se', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[700])),
                      ]
                    ),
                  ),
                ),*/
                SizedBox(height: 30),
                _loading ? Center(child: CircularProgressIndicator()) : Container(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}