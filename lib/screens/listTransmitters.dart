import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum Choice { visualizar, editar, apagar }

class _HomeState extends State<Home> {

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Image.asset('assets/images/logoVW.png'),
        ),
        title: Text('VW Soluções'),
        actions: <Widget>[
          Icon(Icons.help, size: 28, semanticLabel: 'Ajuda'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(Icons.account_circle, size: 28, semanticLabel: 'Usuário'),
          ),
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
              child: Text(
                'Transmissores:',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.TextSubHeader),
              ),
            ),
            
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.green, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '5429WS',
                        style: TextStyle(color: CustomColors.TextGrey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Piscina Fazenda',
                        style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    PopupMenuButton(
                      onSelected: (Choice result) {
                        switch (result) {
                          case Choice.visualizar:
                            Navigator.pushNamed(context, "/transmitter");
                            break;
                          case Choice.editar:
                            Navigator.pushNamed(context, "/home");
                            break;
                          case Choice.apagar:
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                        const PopupMenuItem<Choice>(
                          value: Choice.visualizar,
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.editar,
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.apagar,
                          child: Text('Apagar'),
                        ),
                      ],
                      tooltip: 'Opções',
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.green, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '7260KP',
                        style: TextStyle(color: CustomColors.TextGrey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Fábrica Campinas Unidade II',
                        style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                        const PopupMenuItem<Choice>(
                          value: Choice.visualizar,
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.editar,
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.apagar,
                          child: Text('Apagar'),
                        ),
                      ],
                      tooltip: 'Opções',
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.red, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '2451AB',
                        style: TextStyle(color: CustomColors.TextGrey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Fábrica Campinas Unidade I',
                        style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                        const PopupMenuItem<Choice>(
                          value: Choice.visualizar,
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.editar,
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.apagar,
                          child: Text('Apagar'),
                        ),
                      ],
                      tooltip: 'Opções',
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pushNamed(context, "/new"); },
        tooltip: 'Registrar transmissor',
        child: const Icon(Icons.add),
      ),
    );
  }
}