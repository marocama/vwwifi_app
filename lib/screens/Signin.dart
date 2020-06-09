import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vwwifi/constants/themes.dart';
import 'package:vwwifi/models/User.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController _controllerEmail = TextEditingController(text: "marcus.rcm@outlook.com");
  TextEditingController _controllerPassw = TextEditingController(text: "12345678");

  String _error = "";
  bool _loading = false;

  _validate() {

    String email = "";//_controllerEmail;
    String passw = "";//_controllerPassw;

    if(email.isNotEmpty && email.length >= 5 && email.contains("@")) {
      
      if(passw.isNotEmpty && passw.length >= 6) {
        
        User user = User();
        user.email = email;
        user.password = passw;

        _login(user);

      } else {
        setState(() { _error = "Sua senha deve conter mais de 6 caracteres"; });
      }
    } else {
      setState(() { _error = "Endereço de email inválido"; });
    }
  }

  _login(User user) {
    setState(() { _loading = true; });
  
    FirebaseAuth auth = FirebaseAuth.instance;
    
    auth.signInWithEmailAndPassword(email: user.email, password: user.password).then((firebaseUser) {

      _loading = false;
      Navigator.pushReplacementNamed(context, "/transmitter");

    }).catchError((error) {
      _error = "Erro ao autenticar sua conta, verifique seu email e senha e tente novamente";
    });
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
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(tag: "logo", child: Image.asset("assets/images/logoVW.png", height: 120)),
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email', icon: Icon(Icons.mail, color: Colors.grey)),
                validator: (value) => value.isEmpty ? 'O campo de email não pode ser vazio' : null,
                //onSaved: (value) => _email = value.trim(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Senha', icon: new Icon(Icons.lock, color: Colors.grey)),
                obscureText: true,
                validator: (value) => value.isEmpty ? 'O campo de senha não pode ser vazio' : null,
                //onSaved: (value) => _password = value,
              ),
            ),
            ButtonTheme(
              minWidth: (MediaQuery.of(context).size.width - 35),
              child: RaisedButton(
                child: Text("LOGIN"),
                color: AppThemes.primary,
                onPressed: _validate(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text("Esqueci minha senha", textAlign: TextAlign.center),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Não possui um conta?  ', style: TextStyle(color: Theme.of(context).textTheme.button.color)),
                  TextSpan(text: 'Registre-se', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[700])),
                ]
              ),
            ),
          ],
        ),
      )
    );
  }
}