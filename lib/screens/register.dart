import 'package:vwwifi/util/Firebase.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _controllerNameC = TextEditingController(text: "");
  TextEditingController _controllerEmail = TextEditingController(text: "");
  TextEditingController _controllerPassw = TextEditingController(text: "");
  TextEditingController _controllerPhone = TextEditingController(text: "");

  bool _loading = false;

  Future<void> _register() async {

    setState(() { _loading = true; });

    String result = await Firebase.registerUser(_controllerEmail.text, _controllerPassw.text);

    final snackBar = SnackBar(content: Text(result, style: TextStyle(color: Colors.white)), backgroundColor: (result.contains('Sucesso') ? Colors.green[300] : Colors.red[300]), behavior: SnackBarBehavior.floating);
    
    _scaffoldKey.currentState.showSnackBar(snackBar);

    if(result.contains('Sucesso')) {
      _controllerNameC = TextEditingController(text: "");
      _controllerEmail = TextEditingController(text: "");
      _controllerPassw = TextEditingController(text: "");
      _controllerPhone = TextEditingController(text: "");
      
      Firebase.logoutUser();
    }

    setState(() { _loading = false; });
  }

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
                      Card(
                        margin: EdgeInsets.fromLTRB(15, 50, 15, 5),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Nome completo', icon: Icon(Icons.mail)),
                                validator: (value) => (value.length < 5) ? 'Digite seu nome completo' : null,
                                controller: _controllerNameC,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Email', icon: Icon(Icons.mail)),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) => (value.length < 5 || !value.contains('@')) ? 'Endereço de email inválido' : null,
                                controller: _controllerEmail,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Senha', icon: Icon(Icons.lock)),
                                obscureText: true,
                                validator: (value) => (value.length < 6) ? 'Sua senha deve conter mais de 6 caracteres' : null,
                                controller: _controllerPassw,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Celular', icon: Icon(Icons.phone_android)),
                                keyboardType: TextInputType.phone,
                                validator: (value) => (value.length < 10) ? 'Número inválido, não se esqueça do DDD' : null,
                                controller: _controllerPhone,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: [
                                      TextSpan(text: 'Ao se registrar, você aceita os '),
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
                      ButtonTheme(
                        minWidth: (MediaQuery.of(context).size.width - 30),
                        child: RaisedButton(
                          child: Text("REGISTRAR"),
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          onPressed: () { if(_formKey.currentState.validate()) { FocusScope.of(context).requestFocus(new FocusNode()); _register(); } },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Já possui conta? "),
                          GestureDetector(
                            child: Text("Entrar", style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold)),
                            onTap: () { Navigator.pop(context); },
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