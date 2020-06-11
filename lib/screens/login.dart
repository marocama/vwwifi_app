import 'package:vwwifi/constants/Themes.dart';
import 'package:vwwifi/util/Firebase.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _controllerEmail = TextEditingController(text: "");
  TextEditingController _controllerPassw = TextEditingController(text: "");
  TextEditingController _controllerRecov = TextEditingController(text: "");

  bool _loading = false;

  Future<void> _login() async {

    setState(() { _loading = true; });

    String result = await Firebase.loginUser(_controllerEmail.text, _controllerPassw.text);

    setState(() { _loading = false; });

    if(result.contains('Sucesso')) Navigator.pushReplacementNamed(context, '/listBoard');

    if(result.contains('Verifique')) Firebase.logoutUser();
    
    final snackBar = SnackBar(content: Text(result, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red[300], behavior: SnackBarBehavior.floating);
    
    _scaffoldKey.currentState.showSnackBar(snackBar);

    return result;
  }

  _recoveryProcess() async {

    FocusScope.of(context).requestFocus(FocusNode());

    Navigator.pop(context);

    setState(() { _loading = true; });

    Firebase.recoveryPassword(_controllerRecov.text);

    setState(() { _loading = false; });

    final snackBar = SnackBar(content: Text("Link de recuperação enviado", style: TextStyle(color: Colors.white)), backgroundColor: Colors.green[300], behavior: SnackBarBehavior.floating);
    
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _recoveryDialog() async {
    showGeneralDialog(
      barrierLabel: "Recuperação",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Card(
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-178, left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Insira seu email para recuperação: "),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: _controllerRecov,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text("RECUPERAR"),
                        onPressed: () { _recoveryProcess(); },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0.15)).animate(anim),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Firebase.getCurrentUser().then((value) { if(value != null) Navigator.pushReplacementNamed(context, '/listBoard'); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: _loading ? 0.3 : 1.0,
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
                                decoration: InputDecoration(labelText: 'Email', icon: Icon(Icons.mail, color: Colors.grey)),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) => (value.length < 5 || !value.contains('@')) ? 'Endereço de email inválido' : null,
                                controller: _controllerEmail,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Senha', icon: Icon(Icons.lock, color: Colors.grey)),
                                obscureText: true,
                                validator: (value) => (value.length < 6) ? 'Sua senha deve conter mais de 6 caracteres' : null,
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
                          onPressed: () { if(_formKey.currentState.validate()) { FocusScope.of(context).requestFocus(FocusNode()); _login(); } },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: GestureDetector(
                          child: Text("Esqueci minha senha", textAlign: TextAlign.center),
                          onTap: () { _recoveryDialog(); },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Não possui conta? "),
                          GestureDetector(
                            child: Text("Registre-se", style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold)),
                            onTap: () { Navigator.pushNamed(context, "/register"); },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: _loading ? 1.0 : 0.0,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}