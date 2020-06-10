import 'package:vwwifi/components/DialogTextField.dart';
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

    if(result.contains('Sucess')) Navigator.pushReplacementNamed(context, "/home");

    if(result.contains('Verifique')) Firebase.logoutUser();
    
    final snackBar = SnackBar(content: Text(result, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red[300], behavior: SnackBarBehavior.floating);
    
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<void> _recovery() async {

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DialogTextField(controller: _controllerRecov, labelText: "Email", type: TextInputType.emailAddress);
      }
    );
  }

  @override
  void initState() {
    super.initState();
    //if(Firebase.getCurrentUser() != null) { Navigator.pushReplacementNamed(context, "/home"); }
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
                                decoration: InputDecoration(labelText: 'Senha', icon: new Icon(Icons.lock, color: Colors.grey)),
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
                          onPressed: () { if(_formKey.currentState.validate()) { FocusScope.of(context).requestFocus(new FocusNode()); _login(); } },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: GestureDetector(
                          child: Text("Esqueci minha senha", textAlign: TextAlign.center),
                          onTap: () { _recovery(); print("tocou");},
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