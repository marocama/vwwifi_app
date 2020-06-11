import 'package:flutter/material.dart';
import 'package:vwwifi/util/Firebase.dart';
import 'package:vwwifi/components/BoardCard.dart';

class ListBoard extends StatefulWidget {
  @override
  _ListBoardState createState() => _ListBoardState();
}

enum Choice { visualizar, editar, apagar }

class _ListBoardState extends State<ListBoard> {

  bool _loading = false;

  Future<void> _refresh() async {}

  @override
  void initState() {
    super.initState();
    setState(() { _loading = true; });
    Firebase.getCurrentUser().then((value) { if(value == null) Navigator.pushReplacementNamed(context, '/login'); });
    setState(() { _loading = false; });
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
                backgroundImage: NetworkImage("https://cdn-ofuxico.akamaized.net/img/upload/noticias/2019/06/19/bruna_marquezine_reproducao_instagram_351888_36.jpg"),
                radius: 18.0,
              ),
              onTap: () { Navigator.pushNamed(context, "/profile"); },
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