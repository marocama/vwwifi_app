import 'package:flutter/material.dart';
import 'package:vwwifi/models/User.dart';
import 'package:vwwifi/util/Firebase.dart';
import 'package:vwwifi/components/BoardCard.dart';

class ListBoard extends StatefulWidget {
  @override
  _ListBoardState createState() => _ListBoardState();
}

class _ListBoardState extends State<ListBoard> {

  final _regiKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _controllerNSerial = TextEditingController(text: "");
  TextEditingController _controllerIdentif = TextEditingController(text: "");

  bool _loading = false;

  User user = User(uid: "", name: "", email: "", password: "", phone: "", expire: DateTime.now(), photoUrl: "", accountType: "", maxDevices: 0, devices: List());

  _registerProcess() async {

    FocusScope.of(context).requestFocus(FocusNode());

    Navigator.pop(context);

    setState(() { _loading = true; });
    
    String result = "";

    if(user.devices.length < user.maxDevices) {

      result = await Firebase.registerDevice(_controllerNSerial.text.trim().toUpperCase(), _controllerIdentif.text);

      if(result.contains('Novo')) {
        Firebase.getDataLoggedUser().then((value) { 
          setState(() { user = value; }); 
        });
      }
    } else {

      result = "Máximo de dispositivos alcançado, entre em contato";
    }

    setState(() { _loading = false; });

    final snackBar = SnackBar(content: Text(result, style: TextStyle(color: Colors.white)), backgroundColor: (result.contains('Novo')) ? Colors.green[300] : Colors.red[300], behavior: SnackBarBehavior.floating);
    
    _scaffoldKey.currentState.showSnackBar(snackBar);

  }

  _registerDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          insetPadding: EdgeInsets.symmetric(horizontal: 15.0),
          title: Text("Registrar dispositivo"),
          content: Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/4,
                child: Form(
                  key: _regiKey,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Número Serial', hintText: '1234AB'),
                        validator: (value) => (value.length != 6) ? 'Número Serial deve conter 6 caracteres' : null,
                        controller: _controllerNSerial,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Identificador', hintText: 'Minha casa'),
                        validator: (value) => (value.length < 3) ? 'Identificador muito curto' : null,
                        controller: _controllerIdentif,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () { Navigator.of(context).pop(); }, 
              child: Text("CANCELAR"),
            ),
            FlatButton(
              onPressed: () { if(_regiKey.currentState.validate()) { _registerProcess(); }}, 
              child: Text("CADASTRAR"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() { _loading = true; });
    Firebase.getCurrentUser().then((logged) { 
      if(logged == null) { 
        Navigator.pushReplacementNamed(context, '/login'); 
      } else { 
        Firebase.lastLogin();
        Firebase.getDataLoggedUser().then((value) { 
          setState(() { _loading = false; user = value; }); 
        }); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('VW Soluções'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 25.0, 10.0),
            child: GestureDetector(
              child: CircleAvatar(
                backgroundImage: (user.photoUrl.isNotEmpty) ? NetworkImage(user.photoUrl) : null,
                backgroundColor: (user.photoUrl.isNotEmpty) ? Colors.transparent : Colors.grey,
                radius: 18.0,
              ),
              onTap: () { Navigator.pushNamed(context, "/profile", arguments: user); },
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Opacity(
            opacity: _loading ? 0.2 : 1.0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
                    child: Text('Dispositivos:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height-100,
                    child: (user.devices.length == 0) ? 
                    ListTile(
                      title: Row(children: <Widget>[Icon(Icons.sentiment_dissatisfied), Text("  Nenhum dispositivo registrado")]), 
                      subtitle: Text("\n Clique no botão abaixo para registrar"),
                    ) : 
                    ListView.builder(
                      itemCount: (user.devices.length + 1), 
                      itemBuilder: (BuildContext context, int index) {
                        return (index == user.devices.length) ?
                        SizedBox(height: 100) :
                        BoardCard(
                          uid: user.devices[index].documentID, 
                          active: user.devices[index].data["active"], 
                          name: user.devices[index].data["name"], 
                          isList: false, 
                          show: () { Navigator.pushNamed(context, "/viewBoard", arguments: {"nSerial": user.devices[index].documentID, "name": user.devices[index].data["name"], "active": user.devices[index].data["active"], "index": index}); }
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: _loading ? 1.0 : 0.0,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _registerDialog(); },
        tooltip: 'Registrar transmissor',
        backgroundColor: Colors.orange[500],
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}