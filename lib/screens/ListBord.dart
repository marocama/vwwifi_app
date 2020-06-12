import 'package:flutter/material.dart';
import 'package:vwwifi/models/User.dart';
import 'package:vwwifi/util/Firebase.dart';
import 'package:vwwifi/components/BoardCard.dart';

class ListBoard extends StatefulWidget {
  @override
  _ListBoardState createState() => _ListBoardState();
}

enum Choice { visualizar, editar, apagar }

class _ListBoardState extends State<ListBoard> {

  bool _loading = false;
  User user = User(uid: "", name: "", email: "", password: "", phone: "", expire: DateTime.now(), photoUrl: "", accountType: "");

  @override
  void initState() {
    super.initState();
    setState(() { _loading = true; });
    Firebase.getCurrentUser().then((value) { (value == null) ? Navigator.pushReplacementNamed(context, '/login') : Firebase.lastLogin(); });
    Firebase.getDataLoggedUser().then((value) { setState(() { _loading = false; user = value; }); });
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
                  BoardCard(),
                  BoardCard(),
                  BoardCard(),
                  BoardCard(),
                  BoardCard(),
                  BoardCard(),
                  BoardCard(),
                  SizedBox(height: 80),
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
        onPressed: () {},
        tooltip: 'Registrar transmissor',
        backgroundColor: Colors.orange[500],
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}