import 'package:flutter/material.dart';
import 'package:vwwifi/models/User.dart';
import 'package:vwwifi/util/Firebase.dart';
import 'package:vwwifi/components/BoardCard.dart';

class ListBoard extends StatefulWidget {
  @override
  _ListBoardState createState() => _ListBoardState();
}

class _ListBoardState extends State<ListBoard> {

  bool _loading = false;
  User user = User(uid: "", name: "", email: "", password: "", phone: "", expire: DateTime.now(), photoUrl: "", accountType: "", boards: List());

  Future<void> _register() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: (MediaQuery.of(context).size.width/2),
                      height: (MediaQuery.of(context).size.height-250),
                      child: Column(
                        children: <Widget>[
                          new Text('?'),
                          Container(
                            height: 20,
                          ),
                          Container(
                            height: 10,
                          ),
                          TextField(decoration: InputDecoration(labelText: "Data")),
                          Container(
                            height: 10,
                          ),
                          TextField(decoration: InputDecoration(labelText: "Hora")),
                          Container(
                            height: 10,
                          ),
                          TextField(
                              decoration: InputDecoration(labelText: 'Mensagem')),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Spacer(),
                              FlatButton(
                                  child: Text('sendMessage'),
                                  onPressed: () {}),
                              FlatButton(
                                  child: Text('closealert'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
      }
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
          print(user.boards.length);
        }); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
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
                    child: (user.boards.length == 0) ? 
                    ListTile(
                      title: Row(children: <Widget>[Icon(Icons.sentiment_dissatisfied), Text("  Nenhum dispositivo registrado")]), 
                      subtitle: Text("\n Clique no botão abaixo para registrar"),
                    ) : 
                    ListView.builder(
                      itemCount: (user.boards.length + 1), 
                      itemBuilder: (BuildContext context, int index) {
                        return (index == user.boards.length) ?
                        SizedBox(height: 100) :
                        BoardCard(
                          uid: user.boards[index].documentID, 
                          active: user.boards[index].data["active"], 
                          name: user.boards[index].data["name"], 
                          isList: false, 
                          show: () { Navigator.pushNamed(context, "/viewBoard", arguments: {"board": user.boards[index], "index": index}); }
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
        onPressed: () { _register(); },
        tooltip: 'Registrar transmissor',
        backgroundColor: Colors.orange[500],
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}